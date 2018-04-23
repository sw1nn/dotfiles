(use-package git-gutter
  :ensure t
  :diminish git-gutter-mode
  :init (global-git-gutter-mode))

(setq magit-last-seen-setup-instructions "1.4.0")

(use-package magit
  :pin melpa-stable
  :ensure t
  :bind (("C-c g" . magit-status)
         ("C-x p" . magit-find-file-completing-read)
         ("C-x 4 p" . sw1nn/magit-find-file-completing-read-other-window)
         ("C-x 5 p" . sw1nn/magit-find-file-completing-read-other-frame))

  :config
  (setq
   magit-process-popup-time -1
   magit-diff-refine-hunk t
   magit-revert-buffers 'silent
   magit-repo-dirs '("~/workspace")
   magit-completing-read-function 'magit-ido-completing-read
   magit-default-tracking-name-function (lambda (_ branch) branch)
   magit-push-arguments '("--set-upstream"))
  :init
  (add-hook 'magit-status-mode-hook 'magit-filenotify-mode)
  (add-hook 'magit-status-refresh-hook 'git-gutter:update-all-windows))

(use-package gist
  :ensure t)

(use-package magit-find-file
  :ensure t)

(use-package magit-filenotify
  :ensure t)
