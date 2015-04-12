(use-package flyspell
             :pin melpa-stable
  :ensure t
  :config
  (setq ispell-program-name (executable-find "aspell")))
