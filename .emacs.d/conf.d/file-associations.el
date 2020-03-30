;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; file associations

(dolist (mode '(("\\.yml\\'" . yaml-mode)
                ("\\.m\\'" . octave-mode)
                ("\\.js\\'" . js3-mode)
                ("\\.gexf\\'" . nxml-mode)
                ("\\.html\\'" . nxml-mode)
                ("\\.cql\\'" . sql-mode)))
  (add-to-list 'auto-mode-alist mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
