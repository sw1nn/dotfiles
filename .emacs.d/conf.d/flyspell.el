(use-package flyspell
  :pin melpa-stable
  :diminish flyspell-mode
  :init
  (progn
    (add-hook 'text-mode-hook 'flyspell-mode)
    (add-hook 'prog-mode-hook 'flyspell-prog-mode))
  :config
  (setq ispell-program-name (executable-find "aspell")))
