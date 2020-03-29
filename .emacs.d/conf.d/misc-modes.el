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

(setq scad-command (expand-file-name "~/.local/bin/openscad"))

(autoload 'scad-mode "scad-mode" "A major mode for editing OpenSCAD code." t)
(add-to-list 'auto-mode-alist '("\\.scad$" . scad-mode))
