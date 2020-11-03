(use-package git-gutter
  :diminish git-gutter-mode
  :init (global-git-gutter-mode)
  :bind (("C-c g d" . git-gutter:popup-hunk)
	 ("C-c g n" . git-gutter:next-hunk)
	 ("C-c g p" . git-gutter:previous-hunk)
	 ("C-c g s" . git-gutter:stage-hunk)
	 ("C-c g v" . git-gutter:revert-hunk)))

(use-package magit
  :bind (("C-c g g" . magit-status)
	 :map ibuffer-mode-map ("* g" . sw1nn/ibuffer-mark-magit-buffers))
  :hook (((magit-post-stage magit-post-unstage) . git-gutter:update-all-windows)
	 (after-save . magit-after-save-refresh-status))
  :config
  (setq magit-default-tracking-name-function (lambda (_ branch) branch)
	magit-diff-refine-hunk t
	magit-last-seen-setup-instructions "1.4.0"
	magit-process-finish-apply-ansi-colors t
	magit-process-popup-time -1
	magit-push-arguments '("--set-upstream")
	magit-repo-dirs '("~/workspace")
	magit-revert-buffers 'silent)
  (defun sw1nn/ibuffer-mark-magit-buffers ()
    "Mark buffers whose major mode is magit related."
    (interactive)
    (ibuffer-mark-on-buffer
     #'(lambda (buf)
	 (with-current-buffer buf
	   (derived-mode-p 'magit-mode 'magit-popup-mode))))))

(setenv "INSIDE_EMACS" (format "%s,comint" emacs-version))
(pinentry-start)

(use-package gist)

;; TODO - causes hangs sometimes? infinite recursion?
;; (use-package magit-filenotify
;;   :ensure t)
