;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; file associations

(dolist (mode '(("\\.md\\'" . markdown-mode)
                ("\\.markdown\\'" . markdown-mode)
                ("\\.yml\\'" . yaml-mode)
                ("\\.scss\\'" . sass-mode)
                ("\\.m\\'" . octave-mode)
                ("\\.js\\'" . js3-mode)
                ("\\.gexf\\'" . nxml-mode)
                ("\\.html\\'" . nxml-mode)
                ("\\.cql\\'" . sql-mode)
		("\\.json\\'" . js3-mode)))
  (add-to-list 'auto-mode-alist mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
