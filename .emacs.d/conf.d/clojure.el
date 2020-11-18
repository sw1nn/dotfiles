(use-package clojure-mode
  :hook ((clojure-mode . rainbow-delimiters-mode)
	 (clojure-mode . origami-mode)
	 (clojure-mode . lsp)
	 (clojurec-mode . lsp)
	 (clojurescript-mode . lsp))
  :bind (:map clojure-mode-map  (("RET" . electrify-return-if-match)))
  :config
  (setq  lsp-enable-indentation nil))

(use-package clj-refactor
  :diminish clj-refactor-mode)
