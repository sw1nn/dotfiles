;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; file associations

(dolist (mode '(("\\.md\\'" . markdown-mode)
                ("\\.markdown\\'" . markdown-mode)
                ("\\.yml\\'" . yaml-mode)
                ("\\.scss\\'" . sass-mode)
                ("\\.m\\'" . octave-mode)))
  (add-to-list 'auto-mode-alist mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
