;;; company-inf-python.el --- Inferior python backend for company-mode

;; Copyright (C) 2014 by Malyshev Artem

;; Author: Malyshev Artem <proofit404@gmail.com>
;; URL: https://github.com/proofit404/company-inf-python
;; Version: 20140530.1238
;; X-Original-Version: 0.0.1
;; Package-Requires: ((company "0.6.12") (cl-lib "0.5.0"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Inferior python backend for company-mode.  Allow company-mode
;; completions in inferior python mode buffers based on runtime
;; definitions.
;;
;; Add company-inf-python to allowed company-mode backends list
;;
;;     (add-to-list 'company-backends 'company-inf-python)

;;; Code:

(require 'company)
(require 'python)
(require 'cl-lib)

(defun company-inf-python-prefix ()
  "Company mode prefix for inferior python."
  (and (eq major-mode 'inferior-python-mode)
       (not (company-in-string-or-comment))
       (or (company-grab-symbol-cons "\\." 1)
           'stop)))

(defun company-inf-python-candidates (arg)
  "Return inferior python completion candidates for ARG."
  (let* ((beginning (save-excursion
                      (with-syntax-table python-dotty-syntax-table
                        (let* ((paren-depth (car (syntax-ppss)))
                               (syntax-string "w_")
                               (syntax-list (string-to-syntax syntax-string)))
                          (while (member
                                  (car (syntax-after (1- (point)))) syntax-list)
                            (skip-syntax-backward syntax-string)
                            (when (or (equal (char-before) ?\))
                                      (equal (char-before) ?\"))
                              (forward-char -1))
                            (while (or
                                    (> (car (syntax-ppss)) paren-depth)
                                    (python-syntax-context 'string))
                              (forward-char -1)))
                          (point)))))
         (end (point))
         (line (buffer-substring-no-properties beginning end))
         (proc (get-buffer-process (current-buffer)))
         (index (- end beginning (length arg)))
         completions)
    (mapc (lambda (candidate)
            (and (> (length candidate) index)
                 (push (substring candidate index) completions)))
          (python-shell-completion-get-completions proc line line))
    (reverse completions)))

;;;###autoload
(defun company-inf-python (command &optional arg)
  "Inferior python backend for company-mode.
Read `company-backends' documentation string for more info about
COMMAND and ARG arguments."
  (interactive (list 'interactive))
  (cl-case command
    (interactive (company-begin-backend 'company-inf-python))
    (prefix (company-inf-python-prefix))
    (candidates (company-inf-python-candidates arg))
    (duplicates t)))

(provide 'company-inf-python)

;;; company-inf-python.el ends here
