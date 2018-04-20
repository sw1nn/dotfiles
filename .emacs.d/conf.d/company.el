(use-package company
  :pin melpa-stable
  :ensure t
  :diminish company-mode
  :config
  (setq company-tooltip-align-annotations t)
  :init
  (global-company-mode t))
