(use-package ivy
  :ensure t
  :init (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) ")
  :diminish ivy-mode)
