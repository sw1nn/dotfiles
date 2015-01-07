;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cider tweaks
;(require 'nrepl-eval-sexp-fu)
;(require 'nrepl-inspect)
;(require 'slamhound)

(setq cider-javadoc-local-paths (list "/usr/local/share/javadoc-w3m/7/docs/api")
      cider-repl-history-file (concat user-emacs-directory ".cider-history")
      cider-popup-stacktraces t
      cider-repl-popup-stacktrace nil
      cider-repl-use-clojure-font-lock t)

(add-hook 'cider-mode-hook
          (lambda nil
            (define-key cider-mode-map (kbd "C-c C-c") 'sw1nn-send-expr-to-repl)
            (define-key cider-mode-map (kbd "C-c C-e") 'sw1nn-send-previous-expr-to-repl)
            (cider-turn-on-eldoc-mode)))

;; line highlighting is pain in the repl.
(add-hook 'cider-repl-mode-hook
          (lambda nil
            (make-local-variable 'global-hl-line-mode)
            (setq global-hl-line-mode nil)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
