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


(defadvice ansi-term (after advise-ansi-term-coding-system activate)
  "Force `ansi-term` to be utf-8 after it launches."
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))


(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  "Kill buffer holding `ansi-term` after process quit."
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))

(ad-activate 'term-sentinel)
