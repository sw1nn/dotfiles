(require 'magit)
(require 'git-gutter-fringe)

(setq git-gutter-fr:side 'left-fringe)

(global-git-gutter-mode t)

(add-hook 'magit-log-edit-mode-hook
          (lambda ()
             (set-fill-column 72)
             (auto-fill-mode 1)))
