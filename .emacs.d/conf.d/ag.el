(use-package ag
             :pin melpa
             :ensure t
             :config
             (setq ag-highlight-search t
                   ag-reuse-buffers t)
             :init (add-hook 'ag-mode-hook
                             (lambda nil
                               (define-key ag-mode-map (kbd "n") 'next-error-no-select)
                               (define-key ag-mode-map (kbd "p") 'previous-error-no-select))))
