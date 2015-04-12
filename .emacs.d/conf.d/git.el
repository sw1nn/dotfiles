(use-package git-gutter
  :ensure t)

(use-package magit
  :pin melpa-stable
  :ensure t
  :diminish magit-auto-revert-mode
  :config
  (setq
   magit-last-seen-setup-instructions "1.4.0"
   magit-process-popup-time -1
   magit-repo-dirs '("~/workspace")
   magit-completing-read-function 'magit-ido-completing-read
   magit-log-margin-spec '(30 nil magit-duration-spec)
   magit-default-tracking-name-function (lambda (_ branch) branch))

  ;; magit has it's own highlighting which conflicts with global-hl-line-mode.
  (add-hook 'magit-status-mode-hook
	    (lambda nil
	      (make-local-variable 'global-hl-line-mode)
	      (setq global-hl-line-mode nil)))
  ;; make logs small font.
  (add-hook 'magit-log-mode-hook
	    (lambda nil
	      (text-scale-decrease 2))))
