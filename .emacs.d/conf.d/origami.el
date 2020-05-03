(use-package origami
  :quelpa (origami :fetcher github
		   :repo "gregsexton/origami.el")
  :bind (:map origami-mode-map
	      ("C-x f f" . origami-recursively-toggle-node)
	      ("C-x f u" . origami-undo)))
