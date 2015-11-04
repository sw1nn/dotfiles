(use-package git-gutter
  :ensure t
  :diminish git-gutter-mode
  :init (global-git-gutter-mode))

(setq magit-last-seen-setup-instructions "1.4.0")

(use-package magit
  :pin melpa-stable
  :ensure t
  :config
  (setq
   magit-process-popup-time -1
   magit-diff-refine-hunk t
   magit-revert-buffers 'silent
   magit-repo-dirs '("~/workspace")
   magit-completing-read-function 'magit-ido-completing-read
   magit-default-tracking-name-function (lambda (_ branch) branch)
   magit-push-arguments '("--set-upstream")))

(use-package gist
  :ensure t)

(use-package magit-find-file
  :ensure t)
