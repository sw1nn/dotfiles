(use-package ag
  :pin melpa-stable
  :ensure t
  :bind ("C-c s" .  sw1nn/ag-search)

  :config
  (setq ag-highlight-search t
        ag-reuse-buffers t)
  :init (add-hook 'ag-mode-hook
                  (lambda nil
                    (define-key ag-mode-map (kbd "n") 'next-error-no-select)
                    (define-key ag-mode-map (kbd "p") 'previous-error-no-select))))
