;(require 'org-trello)
(require 'org-agenda)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(setq org-log-done t)

(add-hook 'org-mode-hook 'visual-line-mode)

;; (setq org-agenda-files '("~/Dropbox/orgmode/home.org"
;;                          "~/Dropbox/orgmode/0-current-sprint.org"))

(setq org-agenda-files
      (quote ("~/workspace/plans/world-domination.org")))
    
(setq org-agenda-custom-commands
      '(("D" "Doing Now" todo "DOING|WAITING|BLOCKED|CCC"
         ((org-agenda-overriding-columns-format
           "%60ITEM(Task) %8Owner %8Effort(Estimated Effort){:} %CLOCKSUM")
          (org-agenda-view-columns-initially t)))
        ("N" "Me Now!" tags-todo "TODO={^[DCWB].+[^E]$}+Owner=\"Neale\""
         ((org-agenda-sorting-strategy '(priority-up effort-down))))
        ("F" "Me in the Future!" tags-todo "TODO={^[TDCWB].+[^E]$}+Owner=\"Neale\""
         ((org-agenda-sorting-strategy '('deadline-up priority-up effort-down))))
        ("C" . "Current Cake Countdown Searches")
        ("Cm" "My Current Cake Countdown"
         ((agenda "" ((org-agenda-span 'week)
                      (org-agenda-start-on-weekday 3)))
          (tags-todo "TODO={^[DCWB].+[^E]$}+Owner=\"Neale\""
                     ((org-agenda-sorting-strategy '(deadline-up priority-up effort-down))))))
        ("Ch" "My Current Cake Countdown History"
         ((agenda "" ((org-agenda-span 'week)
                      (org-agenda-start-on-weekday 3)
                      (org-agenda-show-log t)))
          (tags-todo "TODO={^[DCWB].+[^E]$}+Owner=\"Neale\""
                     ((org-agenda-sorting-strategy '(deadline-up priority-up effort-down))))))
        ("Ct" "Team Current Cake Countdown"
         ((agenda "CATEGORY=\"MC\"" ((org-agenda-files '("~/workspace/plans/world-domination.org"))
                                     (org-agenda-span 'week)
                                     (org-agenda-start-on-weekday 3)))
          (tags-todo "+CATEGORY=\"MC\"+TODO={^[DCWB].+[^E]$}"
                     ((org-agenda-sorting-strategy '(deadline-up priority-up effort-down))))))
        ("Cl" "Team Current Cake Countdown Log"
         ((agenda "CATEGORY=\"MC\"" ((org-agenda-files '("~/workspace/plans/world-domination.org"))
                                     (org-agenda-span 'week)
                                     (org-agenda-start-on-weekday 3)
                                     (org-agenda-show-log t)))
          (tags-todo "+CATEGORY=\"MC\"+TODO={^[DCWB].+[^E]$}"
                     ((org-agenda-sorting-strategy '(deadline-up priority-up effort-down))))))))
