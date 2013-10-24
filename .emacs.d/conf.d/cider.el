;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cider tweaks
;(require 'nrepl-eval-sexp-fu)
;(require 'nrepl-inspect)
(require 'slamhound)

(setq cider-javadoc-local-paths (list "/usr/local/share/javadoc-w3m/7/docs/api")
      cider-history-file (concat user-emacs-directory ".cider-history")
      cider-popup-on-error t
      cider-popup-stacktrace t)
(setq-default cider-port "4001")

(add-to-list 'same-window-buffer-names "*cider*")

(defun ensure-yasnippet-is-first-ac-source ()
  (when (memq 'ac-source-yasnippet ac-sources)
    (setq ac-sources
          (cons 'ac-source-yasnippet
                (remove 'ac-source-yasnippet ac-sources)))))
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ensure-yasnippet-is-first-ac-source)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-repl-mode-hook 'ensure-yasnippet-is-first-ac-source)
(add-hook 'cider-mode-hook
          (lambda nil
            (local-set-key (kbd "C-c C-d") 'ac-nrepl-popup-doc)
;            (define-key cider-interaction-mode-map (kbd "C-c C-i") 'nrepl-inspect)
            (local-set-key (kbd "C-c C-z") 'sw1nn-nrepl-perspective)
            (cider-turn-on-eldoc-mode)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
