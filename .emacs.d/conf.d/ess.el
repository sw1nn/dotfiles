(use-package ess
  :config (add-to-list 'ibuffer-help-buffer-modes 'ess-help-mode)
  :mode ("\\.Rmd\\'" . markdown-mode)
  :pin melpa)
