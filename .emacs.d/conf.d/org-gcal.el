;; TODO - redo with use-package, was complaining about no org-8.2.4, but we have org-8.2.10
(require 'org-gcal)
(use-package alert
  :ensure t)
;; end TODO

(setq org-gcal-client-id "611629336545-li5r07h9tg02gqcokq7j8qgi3o9pqd9a.apps.googleusercontent.com"
      org-gcal-client-secret "z6ho3E0WbLxwMLfakpsoxH3_"
      org-gcal-file-alist '(("neale@sw1nn.com" .  "~/org/agenda/sw1nn.org")
                            ("sw1nn.com_tt10ubhnhnvp8r7enrdcs4sb1c@group.calendar.google.com" . "~/org/agenda/lisa-kids.org")
                            ("sw1nn.com_a3s7j92uimr9lbhcda9fpvtldk@group.calendar.google.com" . "~/org/agenda/neale-kids.org")
                            ("neale@juxt.pro" .  "~/org/agenda/juxt.org")
                            )
      )
