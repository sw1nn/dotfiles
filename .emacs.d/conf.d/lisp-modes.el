(use-package clojure-mode
  :hook (clojure . (rainbow-delimiters-mode))
  :bind (:map clojure-mode-map  (("RET" . electrify-return-if-match))))

(use-package rainbow-delimiters)

(use-package clj-refactor
  :diminish clj-refactor-mode)
