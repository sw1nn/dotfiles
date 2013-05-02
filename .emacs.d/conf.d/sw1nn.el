(defcustom clj-compile-on-save nil "non-nil means clj files should be compiled after save."  )

(defun toggle-clj-compile-on-save ()
  (interactive)
  (setq clj-compile-on-save (not clj-compile-on-save))
  (message "clj-compile-on-save %s" (if clj-compile-on-save "enabled" "disabled")))

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
                                          (file-name-nondirectory (buffer-file-name)))))
                  (progn (message "Compiling...")
                         (nrepl-load-current-buffer))))))

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

(provide 'sw1nn)
