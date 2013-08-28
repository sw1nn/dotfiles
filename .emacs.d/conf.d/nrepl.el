;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; nRepl tweaks
(require 'nrepl-inspect)
(require 'slamhound)

(setq nrepl-javadoc-local-paths (list "/usr/local/share/javadoc-w3m/7/docs/api")
      nrepl-history-file (concat user-emacs-directory ".nrepl-history"))
(setq-default nrepl-port "4001")

(add-to-list 'same-window-buffer-names "*nrepl*")

(defun ensure-yasnippet-is-first-ac-source ()
  (when (memq 'ac-source-yasnippet ac-sources)
    (setq ac-sources
          (cons 'ac-source-yasnippet
                (remove 'ac-source-yasnippet ac-sources)))))
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ensure-yasnippet-is-first-ac-source)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-mode-hook 'ensure-yasnippet-is-first-ac-source)
(add-hook 'nrepl-interaction-mode-hook
          (lambda ()
            (define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)
            (define-key nrepl-interaction-mode-map (kbd "C-c C-i") 'nrepl-inspect)
            (define-key nrepl-interaction-mode-map (kbd "C-c C-z") 'nrepl-perspective)
            (nrepl-turn-on-eldoc-mode)))

(add-hook 'nrepl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'nrepl-interaction-mode-hook 'set-auto-complete-as-completion-at-point-function)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
