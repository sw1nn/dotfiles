(add-hook 'term-mode-hook
          (lambda nil
            ;; line highlighting is pain in the repl.
            (setq term-prompt-regexp "^[^#$%>\n]*[#$%>⪢] *")
            (make-local-variable 'global-hl-line-mode)
            (setq global-hl-line-mode nil)
            (make-local-variable 'mouse-yank-at-point)
            (make-local-variable 'transient-mark-mode)
            (setq transient-mark-mode nil)
            (auto-fill-mode -1)
            (setq tab-width 8 )
            (yas-minor-mode -1)
            (goto-address-mode)))

(add-hook 'shell-mode-hook  'with-editor-export-editor)
(add-hook 'term-exec-hook   'with-editor-export-editor)
(add-hook 'eshell-mode-hook 'with-editor-export-editor)

(setenv "TERM" "xterm-256color")


;;  Force `ansi-term` to be utf-8 after it launches.
(advice-add 'ansi-term :after (lambda (&rest args) (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix)))

(advice-add 'term-sentinel
            :around
            (lambda (orig-fn proc msg)
              (if (memq (process-status proc) '(signal exit))
                  (let ((buffer (process-buffer proc)))
                    (funcall orig-fn proc msg)
                    (kill-buffer buffer))
                (funcall orig-fn proc msg))))
