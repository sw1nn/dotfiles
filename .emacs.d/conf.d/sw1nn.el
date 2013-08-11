(defcustom clj-compile-on-save t "non-nil means clj files should be compiled after save.")
(defcustom clj-test-on-save nil "non-nil means clj test files should be executed after save.")

(defun toggle-clj-compile-on-save ()
  (interactive)
  (setq clj-compile-on-save (not clj-compile-on-save))
  (message "clj-compile-on-save %s" (if clj-compile-on-save "enabled" "disabled")))

(defun toggle-clj-test-on-save ()
  (interactive)
  (setq clj-test-on-save (not clj-compile-on-save))
  (message "clj-test-on-save %s" (if clj-test-on-save "enabled" "disabled")))

(defun toggle-nrepl-popup-stacktraces-in-repl ()
  (interactive)
  (setq nrepl-popup-stacktraces-in-repl (not nrepl-popup-stacktraces-in-repl))
  (message "nrepl-popup-stacktraces-in-repl %s" (if nrepl-popup-stacktraces-in-repl "enabled" "disabled")))

(defun add-clj-compile-on-save ()
  (add-hook 'after-save-hook
            (lambda ()
              (if (and clj-compile-on-save
                       (symbol-value 'nrepl-interaction-mode)
                       (not (string-match "project.clj"
                                          (file-name-nondirectory (buffer-file-name))))
                       (not (string-match ".lein/profiles.clj"
                                          (substring (buffer-file-name) -18))))
                  (progn (message "Compiling...")
                         (nrepl-load-current-buffer)))
              (if (and clj-test-on-save
                       (assq 'clojure-test minor-mode-alist))
                  (clojure-test-run-tests)))))

;; make files opened in .jar etc read-only by default.
(add-hook 'archive-extract-hook
          (lambda ()
            (read-only-mode)))

(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(defun nrepl-perspective ()
  (interactive)
  (delete-other-windows)
  (let ((nrepl-buff (get-buffer "*nrepl*")))
    (when nrepl-buff
      (split-window-right)
      (switch-to-buffer "*nrepl*")))
  (let ((nrepl-server-buff (get-buffer "*nrepl-server*")))
    (when nrepl-server-buff
      (split-window-below)
      (windmove-down)
      (switch-to-buffer "*nrepl-server*")))
  (select-window (get-buffer-window "*nrepl*")))

(require 'grep)

(defun find-grep-in-repository ()
  "Run `find-grep' in repository"
  (interactive)
  (let ((prompt (concat "find " (or (locate-dominating-file default-directory ".git") ".") " -type f ! -wholename \"*/.*\" ! -wholename \"*~\" -exec grep -nH -e {} +")))
    (grep-apply-setting 'grep-find-command prompt)
    (call-interactively 'find-grep)))


(provide 'sw1nn)
