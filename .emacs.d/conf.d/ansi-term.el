(add-hook 'term-mode-hook
          (lambda nil
            ;; line highlighting is pain in the repl.
            (setq term-prompt-regexp "^[^#$%>\n]*[#$%>⪢] *")
            (make-local-variable 'global-hl-line-mode)
            (setq global-hl-line-mode nil)
            (make-local-variable 'mouse-yank-at-point)
            (make-local-variable 'transient-mark-mode)
            (setq mouse-yank-at-point t)
            (setq transient-mark-mode nil)
            (auto-fill-mode -1)
            (setq tab-width 8 )
            (yas-minor-mode -1)
            (goto-address-mode)))

(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))

(ad-activate 'term-sentinel)
