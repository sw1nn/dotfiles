(use-package lsp-mode
  :commands (lsp)
  :bind (:map lsp-mode-map
	      ("C-c C-d" . lsp-describe-thing-at-point)
	      ([remap xref-find-definitions] . lsp-find-definition)
	      ([remap xref-find-references] . lsp-find-references))
  :init
  (setq lsp-keymap-prefix "C-c l"
	;; lsp-auto-guess-root t
	;; lsp-flycheck-live-reporting nil
	;; lsp-keep-workspace-alive nil
	lsp-prefer-capf t
	lsp-ui-doc-delay 1
	;; lsp-signature-auto-activate nil

	;; lsp-enable-file-watchers nil
	;; lsp-enable-folding nil
	;; lsp-enable-indentation nil
	;; lsp-enable-on-type-formatting nil
	;; lsp-enable-symbol-highlighting nil
	)
  )

(use-package lsp-ui
  :commands lsp-ui-mode
  :quelpa (lsp-ui :fetcher github
		  :repo "emacs-lsp/lsp-ui-mode")
  :init (setq lsp-ui-doc-position 'top))

;; if you are helm user
(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol
  :quelpa (lsp-ivy :fetcher github
		   :repo "emacs-lsp/lsp-ivy"))

(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list
  :quelpa (lsp-treemacs :fetcher github
			:repo "emacs-lsp/lsp-treemacs"))
