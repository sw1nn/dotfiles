(use-package go-mode
  :hook (go-mode . (lambda nil
		     (add-hook 'before-save-hook 'gofmt-before-save))))
