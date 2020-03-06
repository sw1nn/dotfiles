(use-package git-gutter
  :ensure t
  :diminish git-gutter-mode
  :init (global-git-gutter-mode)
  :bind (("C-c C-g d" . git-gutter:popup-hunk)
         ("C-c C-g n" . git-gutter:next-hunk)
         ("C-c C-g p" . git-gutter:previous-hunk)
         ("C-c C-g s" . git-gutter:stage-hunk)
         ("C-c C-g v" . git-gutter:revert-hunk)))

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
   magit-default-tracking-name-function (lambda (_ branch) branch)
   magit-push-arguments '("--set-upstream"))
  :init
  (add-hook 'magit-status-mode-hook 'magit-filenotify-mode)
  (add-hook 'magit-status-refresh-hook 'git-gutter:update-all-windows))

(use-package gist
  :ensure t)

(use-package magit-find-file
  :ensure t)

;; TODO - causes hangs sometimes? infinite recursion?
;; (use-package magit-filenotify
;;   :ensure t)
