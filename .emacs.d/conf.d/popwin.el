(add-to-list 'load-path (concat user-emacs-directory "vendor/popwin-el/misc"))

(require 'popwin)
(popwin-mode t)

(setq display-buffer-function 'popwin:display-buffer)

(require 'popup-kill-ring)

(setq popwin:special-display-config
      '(("*Help*"  :height 30)
        ("*Completions*" :noselect t)
        ("*Messages*" :noselect t :height 30)
        ("*compilation*" :noselect t)
        ("*Backtrace*" :height 30)
        ("*Messages*" :height 30)
        ("*Occur*" :noselect t)
        ("*Ido Completions*" :noselect t :height 30)
        ("*magit-commit*" :noselect t :height 40 :width 80 :stick t)
        ("*magit-diff*" :noselect t :height 40 :width 80)
        ("*magit-edit-log*" :noselect t :height 15 :width 80)
        ("\\*ansi-term\\*.*" :regexp t :height 30)
        ("*shell*" :height 30)
        (".*overtone.log" :regexp t :height 30)
        ("*gists*" :height 30)
        ("*sldb.*":regexp t :height 30)
        ("*cider-error*" :height 30 :stick t)
        ("*cider-doc*" :height 30 :stick t)
        ("*cider-src*" :height 30 :stick t)
        ("*cider-result*" :height 30 :stick t)
        ("*cider-macroexpansion*" :height 30 :stick t)
        ("*Kill Ring*" :height 30)
        ("*Compile-Log*" :height 30 :stick t)
        ("*git-gutter+-diff*" :height 15 :stick t)))

;; (push "*Kill Ring*" popwin:special-display-config)

;; ;; undo-tree
;; (push '("*undo-tree*" :width 0.3 :position right) popwin:special-display-config)

;; ;; cider
;; (push "*cider-apropos*" popwin:special-display-config)
;; (push "*cider-macroexpansion*" popwin:special-display-config)
;; (push "*cider-description*" popwin:special-display-config)
;; (push "*cider*" popwin:special-display-config)

;; (push "*inferior-lisp*" popwin:special-display-config)

;; ;; slime
;; (push "*slime-apropos*" popwin:special-display-config)
;; (push "*slime-macroexpansion*" popwin:special-display-config)
;; (push "*slime-description*" popwin:special-display-config)
;; (push '("*slime-compilation*" :noselect t) popwin:special-display-config)
;; (push "*slime-xref*" popwin:special-display-config)

;; (push '(sldb-mode :stick t) popwin:special-display-config)
;; (push 'slime-repl-mode popwin:special-display-config)
;; (push 'slime-connection-list-mode popwin:special-display-config)
