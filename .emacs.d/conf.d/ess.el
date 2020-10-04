(use-package ess
  :config
  (add-to-list 'ibuffer-help-buffer-modes 'ess-help-mode)
  (add-to-list 'ibuffer-help-buffer-modes 'ess-r-help-mode)
  (setq inferior-R-args "--no-save --no-restore-data")
  :mode ("\\.Rmd\\'" . markdown-mode)
  :pin melpa)
