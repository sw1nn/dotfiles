(add-to-list 'load-path (concat user-emacs-directory "vendor/popwin-el/misc"))

(require 'popwin)
(popwin-mode t)

(setq display-buffer-function 'popwin:display-buffer)

(require 'popwin-browse-kill-ring)

(push "*Kill Ring*" popwin:special-display-config)

;; undo-tree
(push '("*undo-tree*" :width 0.3 :position right) popwin:special-display-config)

;; nrepl
(push "*nrepl-apropos*" popwin:special-display-config)
(push "*nrepl-macroexpansion*" popwin:special-display-config)
(push "*nrepl-description*" popwin:special-display-config)
(push "*nrepl*" popwin:special-display-config)

(push "*inferior-lisp*" popwin:special-display-config)

;; slime
(push "*slime-apropos*" popwin:special-display-config)
(push "*slime-macroexpansion*" popwin:special-display-config)
(push "*slime-description*" popwin:special-display-config)
(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
(push "*slime-xref*" popwin:special-display-config)
(push '(sldb-mode :stick t) popwin:special-display-config)
(push 'slime-repl-mode popwin:special-display-config)
(push 'slime-connection-list-mode popwin:special-display-config)
