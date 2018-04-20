(use-package gh
  :ensure t)

(use-package js3-mode
  :mode ("\\.json\\'" . js3-mode)
  :ensure t)

(use-package markdown-mode
  :ensure t
  :mode (("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init
  (add-hook 'markdown-mode-hook 'visual-line-mode))

(use-package yaml-mode
  :ensure t
  :mode ("\\.yaml\\'" . yaml-mode)
  :init
  (add-hook 'yaml-mode-hook
            (lambda ()
              (define-key yaml-mode-map "\C-m" 'newline-and-indent))))

(use-package csv
  :ensure t
  :mode ("\\.tsv\\'" . csv-mode))

(use-package pkgbuild-mode
  :ensure t)

;; (use-package toml-mode
;;   :ensure t)
(use-package dockerfile-mode
  :ensure t)
