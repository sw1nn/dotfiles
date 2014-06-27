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

(defcustom sw1nn-cljs-compile-on-save t "non-nil means cljs files should be compiled after save."
  :type 'boolean
  :group 'sw1nn)

(defun sw1nn-toggle-clj-compile-on-save ()
  (interactive)
  (setq sw1nn-clj-compile-on-save (not sw1nn-clj-compile-on-save))
  (message "sw1nn-clj-compile-on-save %s" (if sw1nn-clj-compile-on-save "enabled" "disabled")))

(defun sw1nn-toggle-cljs-compile-on-save ()
  (interactive)
  (setq sw1nn-cljs-compile-on-save (not sw1nn-cljs-compile-on-save))
  (message "sw1nn-cljs-compile-on-save %s" (if sw1nn-cljs-compile-on-save "enabled" "disabled")))

(defun sw1nn-toggle-clj-test-on-save ()
  (interactive)
  (setq sw1nn-clj-test-on-save (not sw1nn-clj-compile-on-save))
  (message "sw1nn-clj-test-on-save %s" (if sw1nn-clj-test-on-save "enabled" "disabled")))

(defun sw1nn-toggle-cider-repl-popup-stacktraces ()
  (interactive)
  (setq cider-repl-popup-stacktraces (not cider-repl-popup-stacktraces))
  (message "cider-repl-popup-stacktraces %s" (if cider-repl-popup-stacktraces "enabled" "disabled")))

;; from https://github.com/overtone/emacs-live/blob/master/packs/live/clojure-pack/config/paredit-conf.el#L19
(defun sw1nn-paredit-forward ()
  "Feels more natural to move to the beginning of the next item
   in the sexp, not the end of the current one."
  (interactive)
  (if (and (not (paredit-in-string-p))
           (save-excursion
             (ignore-errors
               (forward-sexp)
               (forward-sexp)
               t)))
      (progn
        (forward-sexp)
        (forward-sexp)
        (backward-sexp))
    (paredit-forward)))

;;Treat hyphens as a word character when transposing words
;; based on https://github.com/overtone/emacs-live/blob/a7951de9bad6153537f6ee8af46d18bbc2bf0166/packs/dev/clojure-pack/config/clojure-conf.el#L39
(defvar sw1nn-clojure-mode-kebab-word-sep-syntax-table
  (let ((st (make-syntax-table clojure-mode-syntax-table)))
    (modify-syntax-entry ?- "w" st)
    st))

(defun sw1nn-transpose-kebab-words (arg)
  "Treat hyphens as a word character when transposing words"
  (interactive "*p")
  (with-syntax-table sw1nn-clojure-mode-kebab-word-sep-syntax-table
    (transpose-words arg)))

(defun sw1nn-clj-compilable-file-p (filename)
  (and
   sw1nn-clj-compile-on-save
   (string= "clj" (file-name-extension filename))
   (not (string-match "project.clj"
                      (file-name-nondirectory filename)))
   (not (string-match ".lein/profiles.clj"
                      (substring filename (max (-(length filename)) -18))))))

(defun sw1nn-cljs-compilable-file-p (filename)
  (and
   sw1nn-cljs-compile-on-save
   (string= "cljs" (file-name-extension filename))))

(defun sw1nn-after-save-hook ()
  (when (and (symbol-value 'cider-mode)
             (or (sw1nn-clj-compilable-file-p (buffer-file-name))
                 (sw1nn-cljs-compilable-file-p (buffer-file-name))))
              (message "Compiling...")
              (cider-load-current-buffer)
              (if (and sw1nn-clj-test-on-save
                       (assq 'clojure-test minor-mode-alist))
                  (clojure-test-run-tests))))

(defun sw1nn-add-clj-compile-on-save ()
  (add-hook 'after-save-hook 'sw1nn-after-save-hook))

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

(defun sw1nn-clear-current-server-buffer ()
  "Clear current server buffer"
  (interactive)
  (with-current-buffer (sw1nn-nrepl-current-server-buffer)
    (delete-region (point-min) (point-max))))

(defun sw1nn-show-maximum-output-current-server-buffer ()
  "Show the Maximum output in the current server buffer."
  (interactive)
  (with-current-buffer (sw1nn-nrepl-current-server-buffer)
    (goto-char (point-max))
    (let ((windows (get-buffer-window-list (current-buffer) nil t)))
      (while windows
        (set-window-point (car windows) (point-max))
        (setq windows (cdr windows))))))

(defun sw1nn-cider-perspective (alt-layout)
  (interactive "P")
  (cider-switch-to-last-clojure-buffer)
  (delete-other-windows)
  (split-window-below)
  (windmove-down)
  (shrink-window 15)
  (switch-to-buffer (if alt-layout
                        (cider-find-or-create-repl-buffer)
                      (sw1nn-nrepl-current-server-buffer)))
  (windmove-up)
  (pop-to-buffer (if alt-layout
                        (sw1nn-nrepl-current-server-buffer)
                      (cider-find-or-create-repl-buffer))))

(defun sw1nn-run-cider-command (cmd)
  (with-current-buffer (cider-find-or-create-repl-buffer)
    (goto-char (point-max))
    (insert cmd)
    (cider-repl-return)))

(defun sw1nn-cider-reset (&optional dont-clear-server-buffer-p)
  (interactive "P")
  (save-some-buffers)
  (unless dont-clear-server-buffer-p
    (sw1nn-clear-current-server-buffer))
  (sw1nn-run-cider-command "(do (user/reset))"))

(defun sw1nn-send-expr-to-repl ()
  (interactive)
  (sw1nn-run-cider-command (cider-expression-at-point)))

(defun sw1nn-send-previous-expr-to-repl ()
  (interactive)
  (sw1nn-run-cider-command (cider-last-expression)))

(defun sw1nn-toggle-transparency ()
  (interactive)
  (let ((param (cadr (frame-parameter nil 'alpha))))
    (if (and param (/= param 100))
        (set-frame-parameter nil 'alpha '(100 100))
      (set-frame-parameter nil 'alpha '(85 50)))))

(defun sw1nn-cqlsh ()
  (interactive)
  (let ((cql-buffer-name "*cqlsh*"))
    (if (get-buffer cql-buffer-name)
        (switch-to-buffer cql-buffer-name)
      (let ((multi-term-program "/bin/cqlsh"))
        (with-current-buffer (multi-term)
          (rename-buffer "*cqlsh*"))))))

(defun sw1nn-ag-search (string file-regex directory)
  (interactive (list (read-from-minibuffer "Search string: " (ag/dwim-at-point))
                     (read-from-minibuffer "In filenames matching PCRE: " (ag/buffer-extension-regex))
                     (read-directory-name "Directory: " (ag/project-root default-directory))))
  (ag/search string directory :regexp t :file-regex file-regex))

(defun sw1nn-cider-run-tests ()
  (interactive)
  (save-some-buffers)
  (cider-test-run-tests))

(provide 'sw1nn)
