(use-package lsp-mode
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :bind (:map lsp-mode-map
	      ("C-c C-d" . lsp-describe-thing-at-point))
  :init
  (setq lsp-keymap-prefix "C-c l"
	lsp-auto-configure t
	;; lsp-auto-guess-root t
	lsp-flycheck-live-reporting nil
	lsp-keep-workspace-alive nil
	lsp-prefer-capf t
	lsp-ui-doc-delay 1
	lsp-signature-auto-activate nil
	;; lsp-enable-file-watchers nil
	lsp-enable-folding nil
	lsp-enable-indentation nil
	lsp-enable-on-type-formatting nil
	;; lsp-enable-symbol-highlighting nil
	gc-cons-threshold 100000000
	read-process-output-max (* 1024 1024)
	lsp-completion-provider :capf
	)
)
(use-package lsp-ui
  :commands lsp-ui-mode
  :bind (:map lsp-mode-map (([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
			    ([remap xref-find-references] . lsp-ui-peek-find-references)))
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

(use-package lsp-origami
  :hook (origami-mode . lsp-origami-mode)
  :quelpa (lsp-origami :fetcher github
		       :repo "emacs-lsp/lsp-origami"))
