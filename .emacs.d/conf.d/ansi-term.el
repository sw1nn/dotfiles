;; line highlighting is pain in the repl.
(add-hook 'term-mode-hook
          (lambda nil
            (make-local-variable 'global-hl-line-mode)
            (setq global-hl-line-mode nil)))
