(use-package lsp-mode
  :hook ((prog-mode . lsp)
	 (lsp-mode . lsp-enable-which-key-integration))
  :bind (:map lsp-mode-map
	      ("C-c C-d" . lsp-describe-thing-at-point))
  :init
  (setq lsp-rust-server "rustanalyzer"
	lsp-keymap-prefix "C-c l"
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
	)
  :quelpa (lsp-mode :fetcher github
		    :repo "emacs-lsp/lsp-mode"))

(use-package company-lsp
  :hook (prog-mode . yas-minor-mode)
  :config
  (defun company-lsp--rust-completion-snippet (item)
    "Function providing snippet with the rust language.
It parses the function's signature in ITEM (a CompletionItem)
to expand its arguments."
    (-when-let* ((kind (gethash "kind" item))
		 (is-function (= kind 3)))
      (let* ((detail (gethash "detail" item))
	     (snippet (when (and detail (s-matches? "^\\(pub \\)?\\(unsafe \\)?fn " detail))
			(-some--> (substring detail (1+ (s-index-of "(" detail)) (s-index-of ")" detail))
			  (replace-regexp-in-string "^[^,]*self\\(, \\)?" "" it)
			  (s-split ", " it)
			  (mapconcat (lambda (x) (format "${%s}" x)) it ", ")))))
	(concat "(" (or snippet "$1") ")$0"))))
  :init
  (setq company-lsp-enable-snippet t)
  (push 'company-lsp company-backends))

(use-package lsp-ui
  :commands lsp-ui-mode
  :quelpa (lsp-ui :fetcher github
		  :repo "emacs-lsp/lsp-ui-mode")
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
