(use-package flyspell
  :pin melpa-stable
  :ensure t
  :defer t
  :diminish flyspell-mode
  :init
  (progn
    (add-hook 'text-mode-hook 'flyspell-mode)
    (add-hook 'prog-mode-hook 'flyspell-prog-mode))
  :config
  (setq ispell-program-name (executable-find "aspell")))
