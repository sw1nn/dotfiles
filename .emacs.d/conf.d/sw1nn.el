

(defcustom clj-compile-on-save nil "non-nil means clj files should be compiled after save."  )

(defun toggle-clj-compile-on-save ()
  (interactive)
  (setq clj-compile-on-save (not clj-compile-on-save))
  (message "clj-compile-on-save %s" (if clj-compile-on-save "Enabled" "Disabled")))

(defun add-clj-compile-on-save ()
  (add-hook 'after-save-hook
            (lambda ()
              (if (and clj-compile-on-save
                       (symbol-value 'nrepl-interaction-mode))
                  (progn (message "Compiling...")
                         (nrepl-load-current-buffer))))))

(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(provide 'sw1nn)
