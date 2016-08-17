(use-package cider
  :pin melpa-stable
  :ensure t
  :config
  (setq cider-javadoc-local-paths (list "/usr/local/share/javadoc-w3m/7/docs/api")
        cider-repl-history-file (concat user-emacs-directory ".cider-history")
        cljr-magic-require-namespaces
        '(("edn" . "clojure.edn")
          ("io"   . "clojure.java.io")
          ("log" . "clojure.tools.logging")
          ("set"  . "clojure.set")
          ("str"  . "clojure.string")
          ("t" . "clj-time.core")
          ("tf" . "clj-time.format")
          ("walk" . "clojure.walk")
          ("zip"  . "clojure.zip")
          ("spark" . "sparkling.core")
          ("csv" . "clojure.data.csv"))
        cider-repl-display-help-banner nil
	nrepl-prompt-to-kill-server-buffer-on-quit nil)
  :init
  (add-hook 'cider-mode-hook
            (lambda nil
              (eldoc-mode t)))
  (add-hook 'cider-repl-mode-hook
            (lambda nil
              (make-local-variable 'global-hl-line-mode)
              (setq global-hl-line-mode nil))))

(use-package cider-eval-sexp-fu
  :pin melpa-stable
  :ensure t)
