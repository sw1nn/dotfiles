(use-package haskell-mode
  :defer t
  :ensure t
  :diminish haskell-mode
  :pin melpa-stable
  :init
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation))
