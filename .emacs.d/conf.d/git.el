(require 'magit)
(require 'git-gutter-fringe+)

(global-git-gutter+-mode t)

(setq magit-process-popup-time 5)

(setq magit-command-defaults '((logging nil ("--graph") nil)
                               (committing nil ("--gpg-sign") nil)
                               (tagging nil ("--sign") nil)))
(magit-key-mode-generate 'logging)
(magit-key-mode-generate 'committing)
(magit-key-mode-generate 'tagging)
