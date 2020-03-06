(use-package git-gutter
  :ensure t
  :diminish git-gutter-mode
  :init (global-git-gutter-mode)
  :bind (("C-c g d" . git-gutter:popup-hunk)
         ("C-c g n" . git-gutter:next-hunk)
         ("C-c g p" . git-gutter:previous-hunk)
         ("C-c g s" . git-gutter:stage-hunk)
         ("C-c g v" . git-gutter:revert-hunk)))

(setq magit-last-seen-setup-instructions "1.4.0")

(use-package magit
  :pin melpa-stable
  :ensure t
  :bind (("C-c g g" . magit-status))

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
