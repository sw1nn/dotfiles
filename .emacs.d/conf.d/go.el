(use-package go-mode
  :pin melpa-stable
  :ensure t
  :defer t
  :init
  (add-hook 'go-mode-hook
	    (lambda nil
	      (add-hook 'before-save-hook 'gofmt-before-save))))
