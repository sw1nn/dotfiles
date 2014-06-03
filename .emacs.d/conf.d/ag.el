(setq ag-highlight-search t
      ag-reuse-buffers t)

(add-hook 'ag-mode-hook
          (lambda nil
            (define-key ag-mode-map (kbd "n") 'next-error-no-select)
            (define-key ag-mode-map (kbd "p") 'previous-error-no-select)))
