(use-package origami
  :quelpa (origami :fetcher github
		   :repo "gregsexton/origami.el")
  :bind (:map origami-mode-map
	      ("C-x f f" . origami-recursively-toggle-node)
	      ("C-x f C-f" . origami-show-only-node)
	      ("C-x f C-f" . origami-open-all-nodes)
	      ("C-x f u" . origami-undo)
	      ("C-x f r" . origami-redo)))
