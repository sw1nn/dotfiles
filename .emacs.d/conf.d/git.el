(require 'magit)
(require 'git-gutter-fringe+)

(global-git-gutter+-mode t)

(setq magit-process-popup-time 5
      magit-repo-dirs '("~/workspace"))

;; work better with feature/whatever branch names from hubflow.
(setq magit-default-tracking-name-function (lambda (_ branch) branch))

;; magit has it's own highlighting which conflicts with global-hl-line-mode.
(add-hook 'magit-status-mode-hook
          (lambda nil
            (make-local-variable 'global-hl-line-mode)
            (setq global-hl-line-mode nil)))
