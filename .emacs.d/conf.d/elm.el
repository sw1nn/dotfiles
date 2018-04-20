(require 'flycheck-elm)

(use-package elm-mode
  :ensure t
  :defer t
  :config
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-elm-setup)))
