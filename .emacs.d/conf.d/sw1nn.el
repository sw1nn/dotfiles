(defgroup sw1nn nil
  "sw1nn customizations"
  :prefix "sw1nn-"
  :group 'applications)

(defcustom sw1nn-clj-compile-on-save t "non-nil means clj files should be compiled after save."
  :type 'boolean
  :group 'sw1nn)
(defcustom sw1nn-clj-test-on-save nil "non-nil means clj test files should be executed after save."
  :type 'boolean
  :group 'sw1nn)

(defun sw1nn-toggle-clj-compile-on-save ()
  (interactive)
  (setq sw1nn-clj-compile-on-save (not sw1nn-clj-compile-on-save))
  (message "sw1nn-clj-compile-on-save %s" (if sw1nn-clj-compile-on-save "enabled" "disabled")))

(defun sw1nn-toggle-clj-test-on-save ()
  (interactive)
  (setq sw1nn-clj-test-on-save (not sw1nn-clj-compile-on-save))
  (message "sw1nn-clj-test-on-save %s" (if sw1nn-clj-test-on-save "enabled" "disabled")))

(defun sw1nn-toggle-nrepl-popup-stacktraces-in-repl ()
  (interactive)
  (setq nrepl-popup-stacktraces-in-repl (not nrepl-popup-stacktraces-in-repl))
  (message "nrepl-popup-stacktraces-in-repl %s" (if nrepl-popup-stacktraces-in-repl "enabled" "disabled")))

;;Treat hyphens as a word character when transposing words
;; based on https://github.com/overtone/emacs-live/blob/a7951de9bad6153537f6ee8af46d18bbc2bf0166/packs/dev/clojure-pack/config/clojure-conf.el#L39
(defvar sw1nn-clojure-mode-with-hyphens-as-word-sep-syntax-table
  (let ((st (make-syntax-table clojure-mode-syntax-table)))
    (modify-syntax-entry ?- "w" st)
    st))

(defun sw1nn-transpose-words-with-hyphens (arg)
  "Treat hyphens as a word character when transposing words"
  (interactive "*p")
  (with-syntax-table sw1nn-clojure-mode-with-hyphens-as-word-sep-syntax-table
    (transpose-words arg)))

(defun add-clj-compile-on-save ()
  (add-hook 'after-save-hook
            (lambda ()
              (if (and sw1nn-clj-compile-on-save
                       (symbol-value 'nrepl-interaction-mode)
                       (not (string-match "project.clj"
                                          (file-name-nondirectory (buffer-file-name))))
                       (not (string-match ".lein/profiles.clj"
                                          (substring (buffer-file-name) -18))))
                  (progn (message "Compiling...")
                         (nrepl-load-current-buffer)))
              (if (and sw1nn-clj-test-on-save
                       (assq 'clojure-test minor-mode-alist))
                  (clojure-test-run-tests)))))

;; make files opened in .jar etc read-only by default.
(add-hook 'archive-extract-hook
          (lambda ()
            (read-only-mode)))

(defun sw1nn-toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(defun sw1nn-nrepl-current-server-buffer ()
  (let ((nrepl-server-buf (replace-regexp-in-string "connection" "server" (nrepl-current-connection-buffer))))
    (when nrepl-server-buf
      (get-buffer nrepl-server-buf))))

(defun sw1nn-nrepl-perspective ()
  (interactive)
  (delete-other-windows)
  (split-window-below)
  (windmove-down)
  (shrink-window 15)
  (switch-to-buffer (sw1nn-nrepl-current-server-buffer))
  (windmove-up)
  (pop-to-buffer (nrepl-find-or-create-repl-buffer)))

(require 'grep)

(defun find-grep-in-repository ()
  "Run `find-grep' in repository"
  (interactive)
  (let ((prompt (concat "find " (or (locate-dominating-file default-directory ".git") ".") " -type f ! -wholename \"*/.*\" ! -wholename \"*~\" -exec grep -nH -e {} +")))
    (grep-apply-setting 'grep-find-command prompt)
    (call-interactively 'find-grep)))


(provide 'sw1nn)
