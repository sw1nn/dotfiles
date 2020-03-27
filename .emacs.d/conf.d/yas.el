(use-package yasnippet
  :ensure t
  :defer t
  :pin melpa-stable
  :init (add-hook 'prog-mode-hook #'yas-minor-mode)
  :diminish yas-minor-mode)
