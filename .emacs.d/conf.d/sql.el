(use-package sqlup-mode
  :hook((sql-mode . sqlup-mode)
	(sql-interactive-mode . sqlup-mode))
  :config
  (setq sql-upcase-mixed-case t))
