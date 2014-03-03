(add-hook 'ag-mode-hook
          (lambda nil 
            (define-key ag-mode-map (kbd "n") 'next-error-no-select)
            (define-key ag-mode-map (kbd "p") 'previous-error-no-select)))
