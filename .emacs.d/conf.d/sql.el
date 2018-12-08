(use-package sqlup-mode
  :pin melpa-stable
  :ensure t
  :config
  (setq sql-upcase-mixed-case t)
  :init
  (add-hook 'sql-mode-hook 'sqlup-mode)
  (add-hook 'sql-interactive-mode-hook 'sqlup-mode))
