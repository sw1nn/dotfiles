(use-package haskell-mode
  :defer t
  :ensure t
  :pin melpa-stable
  :init
  (add-hook 'haskell-mode-hook #'turn-on-haskell-indentation)
  (add-hook 'haskell-mode-hook #'interactive-haskell-mode)
  (add-hook 'haskell-mode-hook #'haskell-mode-stylish-buffer)
  (add-hook 'haskell-mode-hook #'haskell-mode-stylish-buffer))

(use-package ghc
  :defer t
  :ensure t
  :pin melpa-stable)

(use-package company-ghc
  :defer t
  :ensure t
  :pin melpa-stable)
