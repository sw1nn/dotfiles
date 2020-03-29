(use-package eshell
  :demand
  :hook ((eshell-mode . sw1nn/eshell-setup)
         (eshell-mode . eldoc-mode))
  :bind (:map eshell-mode-map
	      ("M-r" 'counsel-esh-history))
  :init
  (setq eshell-save-history-on-exit t
	eshell-destroy-buffer-when-process-dies t
	eshell-where-to-jump 'begin
	eshell-hist-ignoredups t
	eshell-history-size 10000)

  (defun eshell/g (&rest args)
    (magit-status (pop args) nil)
    (eshell/echo))   ;; The echo command suppresses output

  (defun eshell/s (&rest args)
    (web-search (pop args))
    (eshell/echo))
  
  (defun sw1nn/eshell-setup ()
    (setq-local eldoc-idle-delay 2)
    (setenv "PAGER" "bat")
    (setenv "EDITOR" "emacsclient"))
  
  :config
  (use-package em-alias
    :ensure nil
    :config
    (eshell/alias "cs" "apt search $1")
    (eshell/alias "e" "find-file $1")
    (eshell/alias "eo" "find-file-other-window $1")
    (eshell/alias "gd" "magit-diff-unstaged")
    (eshell/alias "gds" "magit-diff-staged")
    (eshell/alias "d" "dired $1")
    (eshell/alias "ll" "ls -l")
    (eshell/alias "la" "ls -A")
    (eshell/alias "l" "ls -CF"))

  (use-package esh-help
    :config (setup-esh-help-eldoc))

  ;; BASH completion for the shell buffer
  (use-package bash-completion
    :config
    (defun eshell-bash-completion ()
      (setq-local bash-completion-nospace t)
      (while (pcomplete-here
              (nth 2 (bash-completion-dynamic-complete-nocomint
                      (save-excursion (eshell-bol) (point)) (point))))))
    (setq eshell-default-completion-function 'eshell-bash-completion))
  (use-package em-smart
    :ensure nil
    :hook (eshell-mode . eshell-smart-initialize))
  (use-package eshell-git-prompt
    :ensure t
    :config
    (eshell-git-prompt-use-theme 'powerline)))

