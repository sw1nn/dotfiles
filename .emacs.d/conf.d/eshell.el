(use-package eshell
  :demand
  :bind (:map eshell-mode-map
  	      ("M-r" . counsel-esh-history))
  :init
  (setq eshell-destroy-buffer-when-process-dies t
	eshell-hist-ignoredups t
	eshell-history-size 10000
	eshell-save-history-on-exit t
	eshell-where-to-jump 'begin)

  (defun eshell/g (&rest args)
    (magit-status (pop args) nil)
    (eshell/echo))   ;; The echo command suppresses output

  (defun eshell/s (&rest args)
    (web-search (pop args))
    (eshell/echo))
  
  (defun sw1nn/eshell-setup ()
    (setq-local eldoc-idle-delay 2)
    (bind-key "M-r" 'counsel-esh-history eshell-mode-map)
    (setenv "PAGER" "cat")
    (setenv "EDITOR" "emacsclient"))
  
  :config
  (use-package em-alias
    :ensure nil
    :config
    (eshell/alias "cs" "apt search $1")
    (eshell/alias "e" "find-file $1")
    (eshell/alias "eo" "find-file-other-window $1")
    (eshell/alias "gd" "magit-diff-unstaged")
    (eshell/alias "gl" "magit-log-head")
    (eshell/alias "gds" "magit-diff-staged")
    (eshell/alias "d" "dired $1")
    (eshell/alias "ll" "ls -l")
    (eshell/alias "la" "ls -A")
    (eshell/alias "l" "ls -CF")
    (eshell/alias "rg" "counsel-rg $1"))
  
  ;; TODO having the :hook at the parent level doesn't work,
  ;; presumably because of some issue with late loading. This fudge
  ;; seems to work for now
  (use-package esh-setup
    :ensure nil
    :hook   ((eshell-mode . sw1nn/eshell-setup)
	     (eshell-mode . eldoc-mode)))
  
  (use-package esh-help
    :demand
    :init (setup-esh-help-eldoc))

  ;; ;; BASH completion for the shell buffer
  ;; (use-package bash-completion
  ;;   :config
  ;;   (defun eshell-bash-completion ()
  ;;     (setq-local bash-completion-nospace t)
  ;;     (while (pcomplete-here
  ;;             (nth 2 (bash-completion-dynamic-complete-nocomint
  ;;                     (save-excursion (eshell-bol) (point)) (point))))))
  ;;   (setq eshell-default-completion-function 'eshell-bash-completion))
  
  (use-package em-smart
    :ensure nil
    :hook (eshell-mode . eshell-smart-initialize))
  
  (use-package eshell-git-prompt
    :demand
    :config
    (eshell-git-prompt-use-theme 'powerline)))
