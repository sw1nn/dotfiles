;(require 'org-trello)
(require 'org-agenda)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(setq org-agenda-files '("~/Dropbox/orgmode/home.org"
                         "~/Dropbox/orgmode/0-current-sprint.org"))
(setq org-log-done t)
