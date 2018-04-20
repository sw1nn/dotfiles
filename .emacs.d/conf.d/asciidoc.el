(use-package adoc-mode
  :ensure t
  :mode ("\\.adoc\\'" . adoc-mode)
  :bind (:map adoc-mode-map
              ("M-q" . sw1nn/fill-paragraph-one-sentence-per-line)
              ;; ([?\. ? ] . sw1nn/electic-dot-one-sentence-per-line)
              )

  :init
  (add-hook 'adoc-mode-hook 'visual-line-mode))
