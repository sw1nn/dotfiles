(use-package haskell-mode
  :ensure t
  :pin melpa-stable
  :init
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation))
