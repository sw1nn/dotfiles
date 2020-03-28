(use-package ivy
  :ensure t
  :init (ivy-mode 1)
  :bind (([remap isearch-forward] . swiper)
	 ([remap isearch-backward] . swiper-backward))
  :config
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) ")
  :diminish ivy-mode)
