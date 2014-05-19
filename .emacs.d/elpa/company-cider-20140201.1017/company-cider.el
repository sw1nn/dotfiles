;;; company-cider.el --- company-mode completion back-end for Cider
;; Version: 20140201.1017

;; Copyright 2014, Steckerhalter

;; Author: Steckerhalter
;; Package-Requires: ((company "0.6.13") (cider "0.6.0"))
;; Keywords: company-mode completion backend cider clojure
;; URL: https://github.com/clojure-emacs/company-cider

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; `company-mode' auto-completion backend for Clojure with Emacs Cider
;;
;; Some code to get completions for java methods has been adapted from
;;  `ac-nrepl' by Steve Purcell which can be found at
;;  https://github.com/clojure-emacs/ac-nrepl.

;;; Usage:

;; (eval-after-load 'company
;;   '(add-to-list 'company-backends 'company-cider))

;;; Code:

(require 'company)
(require 'nrepl-client)
(require 'cider-interaction)
(eval-when-compile (require 'cl))

(defgroup company-cider nil
  "Completion back-end for Cider."
  :group 'company)

(defun company-cider-nrepl-available-p ()
  "Return t if nrepl is available for completion, otherwise nil."
  (condition-case nil
      (not (null (nrepl-current-tooling-session)))
    (error nil)))

(defun company-cider-sync-eval (clj)
  "Synchronously evaluate CLJ.
Result is a plist, as returned from `nrepl-send-string-sync'."
  (nrepl-send-string-sync clj (cider-current-ns) (nrepl-current-tooling-session)))

(defun company-cider-candidates* (clj)
  "Return completion candidates produced by evaluating CLJ."
  (let ((response (plist-get (company-cider-sync-eval (concat "(require 'complete.core) " clj))
                             :value)))
    (when response
      (car (read-from-string response)))))

(defun company-cider-unfiltered-clj (prefix clj)
  "Return a version of CLJ with the completion prefix inserted."
  (format clj prefix))

(defun company-cider-filtered-clj (prefix clj)
  "Build an expression which extracts the prefixed values from CLJ."
  (concat "(filter #(.startsWith % \"" prefix "\")"
          (company-cider-unfiltered-clj prefix clj) ")"))

(defun company-cider-candidates (prefix)
  (or
   (cider-dispatch-complete-symbol prefix)
   (company-cider-candidates-java-methods prefix)
   (company-cider-candidates-static-methods prefix)))

(defun company-cider-candidates-java-methods (prefix)
  "Return java method candidates."
  (delq nil
        (delete-dups
         (mapcar (lambda (hit) (nth 0 (split-string hit "#")))
                 (company-cider-candidates*
                  (company-cider-filtered-clj prefix
                                              "(for [class (vals (ns-imports *ns*))
                   method (.getMethods class)
                   :when (not (java.lang.reflect.Modifier/isStatic (.getModifiers method)))]
               (str \".\" (.getName method) \"#\" (.getName class)))"))))))

(defun company-cider-candidates-static-methods (prefix)
  "Return static method candidates."
  (company-cider-candidates*
   (company-cider-filtered-clj prefix
                               "(let [prefix \"%s\"]
       (if (or (not (.contains prefix \"/\"))
               (.startsWith prefix \"/\"))
         '()
          (let [scope (symbol (first (.split prefix \"/\")))]
            (map (fn [memb] (str scope \"/\" memb))
                 (when-let [class (try (complete.core/resolve-class scope)
                                   (catch java.lang.ClassNotFoundException e nil))]
                   (complete.core/static-members class))))))  ")))


(defun company-cider-documentation (symbol)
  "Return documentation for the given SYMBOL, if available."
  (let ((raw-doc (plist-get (company-cider-sync-eval
                             (format "(try (eval '(clojure.repl/doc %s))
                                        (catch Exception e nil))"
                                     symbol))
                            :stdout)))
    (when raw-doc
      (let ((doc
             (substring-no-properties
              (replace-regexp-in-string
               "\r" ""
               (replace-regexp-in-string
                "^\\(  \\|-------------------------\r?\n\\)" ""
                raw-doc)))))
        (unless (string-match "\\`[ \t\n]*\\'" doc)
          doc)))))

(defun company-cider-meta (symbol)
  "Return meta documentation for the given SYMBOL, if available."
  (when (cider-connected-p)
    (let* ((form
            (format
             "(try (clojure.core/meta (clojure.core/resolve (clojure.core/read-string \"%s\")))
                (catch Throwable t nil))"
             symbol))
           (value (when symbol
                    (cider-get-raw-value (cider-tooling-eval-sync form nrepl-buffer-ns)))))
      (unless (string= value "nil")
        (let* ((doc (when (string-match ":doc \"\\(.*?\\)\"," value)
                      (replace-regexp-in-string "\\\\n " "" (match-string 1 value))))
               (name (when (string-match ":name \\([^,]+\\)" value)
                       (propertize
                        (match-string 1 value)
                        'face 'font-lock-variable-name-face)))
               (args (when (string-match ":arglists \\([^,]+\\)" value)
                       (propertize
                        (match-string 1 value)
                        'face 'font-lock-constant-face)))
               (meta (when (and args doc) (concat name ": " args " " doc)))
               (truncate (> (length meta) (- (frame-width) 1))))
          (if truncate
              (concat
               (truncate-string-to-width
                meta (- (frame-width) 4)) "...")
            meta))))))

(defun company-cider-location (symbol)
  (let ((form (format "(clojure.repl/source %s)" symbol))
        (src-buffer (get-buffer-create cider-src-buffer)))
    (with-current-buffer src-buffer
      (erase-buffer)
      (clojure-mode)
      (cider-popup-buffer-mode +1))
    (cider-tooling-eval form (cider-popup-eval-out-handler src-buffer) nrepl-buffer-ns)
    (cons src-buffer 1)))

(defun company-cider-doc-buffer (arg)
  (let ((doc (company-cider-documentation arg)))
    (when doc
      (with-current-buffer (company-doc-buffer doc)
        (clojure-mode)
        (current-buffer)))))

(defun company-cider-prefix ()
  (and (or (equal major-mode 'clojure-mode)
           (equal major-mode 'cider-repl-mode))
       (company-cider-nrepl-available-p)
       (not (company-in-string-or-comment))
       (let ((prefix (company-grab-symbol)))
         (if prefix (substring-no-properties prefix) 'stop))))

;;;###autoload
(defun company-cider (command &optional arg &rest ignored)
  (interactive (list 'interactive))
  (case command
    (interactive (company-begin-backend 'company-cider))
    (prefix (company-cider-prefix))
    (candidates (company-cider-candidates arg))
    (meta (company-cider-meta arg))
    (doc-buffer (company-cider-doc-buffer arg))
    (location (company-cider-location arg))))

(provide 'company-cider)
;;; company-cider.el ends here
