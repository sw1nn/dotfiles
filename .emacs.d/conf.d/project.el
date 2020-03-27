;;; project.el --- Initialise project handling

;;; Commentary:

;;; Code:
(use-package projectile
  :ensure t
  :init
  (setq projectile-globally-ignored-files '(".DS_Store" "Icon" "TAGS")
        projectile-globally-ignored-file-suffixes '(".elc" ".pyc" ".o")
        projectile-project-search-path '("~/workspace/")
        projectile-kill-buffers-filter 'kill-only-files
        projectile-ignored-projects '("~/" "/tmp")
        projectile-completion-system 'default)
  :config
  (projectile-mode +1)
  (setq projectile-mode-line-prefix " 👷")
  :bind
  (:map projectile-mode-map
	("s-p" . 'projectile-command-map)
	("C-c p" . 'projectile-command-map)))

(use-package projectile-ripgrep
  :ensure t
  :bind (("C-c s" . #'counsel-rg)))
