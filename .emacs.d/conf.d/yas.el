(use-package yasnippet
  :ensure t
  :pin melpa-stable
  :init
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  )
