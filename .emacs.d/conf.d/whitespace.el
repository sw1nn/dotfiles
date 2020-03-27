(use-package ws-butler
  :ensure t
  :config (add-hook 'prog-mode-hook #'ws-butler-mode)
  :diminish ws-butler-mode)
