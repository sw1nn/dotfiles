(use-package atomic-chrome
  :demand
  :init (setq atomic-chrome-buffer-open-style 'frame
	      atomic-chrome-url-major-mode-alist
	      '(("github\\.com" . gfm-mode)
		("play\\.rust-lang\\.org" . rust-mode)))
  :config (atomic-chrome-start-server))
