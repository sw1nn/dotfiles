;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; nRepl tweaks
(setq nrepl-javadoc-local-paths (list "/usr/local/share/javadoc-w3m/7/docs/api"))
(setq-default nrepl-port "4001")

(add-to-list 'same-window-buffer-names "*nrepl*")
(add-hook 'nrepl-interaction-mode-hook
          (lambda ()
            (define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)
            (nrepl-turn-on-eldoc-mode)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
