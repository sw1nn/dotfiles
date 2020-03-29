(use-package haskell-mode
  :hook
  (haskell-mode . turn-on-haskell-indentation)
  (haskell-mode . interactive-haskell-mode)
  (haskell-mode . haskell-mode-stylish-buffer))

(use-package ghc)

(use-package company-ghc)
