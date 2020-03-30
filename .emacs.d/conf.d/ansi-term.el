(add-hook 'term-mode-hook
          (lambda nil
            ;; line highlighting is pain in the repl.
            (setq term-prompt-regexp "^[^#$%>\n]*[#$%>⪢] *")
            (setq-local hscroll-margin 0) ;; in shells, otherwise it causes jumpiness
	    (setq-local global-hl-line-mode nil)
	    (setq-local mouse-yank-at-point t)
	    (setq-local transient-mark-mode nil)
            (auto-fill-mode -1)
            (setq tab-width 8 )
            (yas-minor-mode -1)
            (goto-address-mode)))

(add-hook 'shell-mode-hook  'with-editor-export-editor)
(add-hook 'term-exec-hook   'with-editor-export-editor)

(setenv "TERM" "xterm-256color")

;;  Force `ansi-term` to be utf-8 after it launches.
(advice-add 'ansi-term :after (lambda (&rest args) (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix)))


;; kill buffer when shell exits
(advice-add 'term-sentinel
            :around
            (lambda (orig-fn proc msg)
              (if (memq (process-status proc) '(signal exit))
                  (let ((buffer (process-buffer proc)))
                    (funcall orig-fn proc msg)
                    (kill-buffer buffer))
                (funcall orig-fn proc msg))))
