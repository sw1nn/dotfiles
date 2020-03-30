(use-package gh)

(use-package js3-mode
  :mode ("\\.json\\'" . js3-mode))

(use-package markdown-mode
  :hook (markdown-mode . visual-line-mode)
  :mode (("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package yaml-mode
  :mode ("\\.yaml\\'" . yaml-mode)
  :bind (:map yaml-mode-map ("C-m" . newline-and-indent)))

(use-package csv
  :mode ("\\.tsv\\'" . csv-mode))

(use-package pkgbuild-mode)

;; (use-package toml-mode
;;   :ensure t)
(use-package dockerfile-mode)

(use-package scad-mode
  :quelpa (scad-mode :fetcher url
		     :url "https://raw.githubusercontent.com/openscad/openscad/openscad-2019.05/contrib/scad-mode.el")
  :config (setq scad-command (expand-file-name "~/.local/bin/openscad")))
