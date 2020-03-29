(use-package flyspell
  :hook ((text-mode . flyspell-mode)
  	 (prog-mode . flyspell-prog-mode))
  :config
  (setq ispell-program-name (executable-find "aspell"))
  :diminish flyspell-mode)
