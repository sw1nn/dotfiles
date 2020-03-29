(use-package adoc-mode
  :mode ("\\.adoc\\'" . adoc-mode)
  :hook (adoc-mode . visual-line-mode)
  :bind (:map adoc-mode-map
              ("M-q" . sw1nn/fill-paragraph-one-sentence-per-line)
              ;; ([?\. ? ] . sw1nn/electic-dot-one-sentence-per-line)
              ))
