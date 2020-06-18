(use-package ess
  :config
  (add-to-list 'ibuffer-help-buffer-modes 'ess-help-mode)
  (add-to-list 'ibuffer-help-buffer-modes 'ess-r-help-mode)
  :mode ("\\.Rmd\\'" . markdown-mode)
  :pin melpa)
