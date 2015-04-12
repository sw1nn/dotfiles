(use-package flyspell
  :pin melpa-stable
  :ensure t
  :diminish flyspell-mode
  :config
  (setq ispell-program-name (executable-find "aspell")))
