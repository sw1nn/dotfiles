;; https://github.com/howardabrams/dot-files/blob/master/emacs-org.org


(use-package org
  :ensure t                            ; But it comes with Emacs now!?
  :init
  (setq org-use-speed-commands t
        org-hide-emphasis-markers t
        org-completion-use-ido t
        org-outline-path-complete-in-steps nil
        org-src-fontify-natively t ;; Pretty code blocks
        org-src-tab-acts-natively t
        org-confirm-babel-evaluate nil
        org-todo-keywords '((sequence "TODO(t)" "DOING(g)" "|" "DONE(d)")
                            (sequence "|" "CANCELED(c)"))
        org-default-notes-file "~/org/notes.org"
        org-refile-targets (quote ((org-agenda-files :maxlevel . 1)))
        org-refile-use-outline-path (quote file)
        org-agenda-files "~/org/agenda/active-agendas"
        org-refile-allow-creating-parent-nodes (quote confirm)
        org-log-done (quote time)
        org-log-into-drawer t
        org-log-reschedule (quote note)
        org-ditaa-jar-path "/usr/share/java/ditaa/ditaa-0_10.jar"
        )

  (add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))
  (add-to-list 'auto-mode-alist '(".*/[0-9]*$" . org-mode)) ;; Journal entries
  (eval-after-load 'autoinsert
    '(add-to-list 'auto-insert-alist '(".*/[0-9]*$" . journal-file-insert)))
  (add-hook 'org-mode-hook 'yas-minor-mode-on)
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("<f6>" . org-capture)
         ("C-M-|" . indent-rigidly)
         ("C-c f y" . journal-file-yesterday)
         ("C-c f j" . journal-file-today))
  :config
  (font-lock-add-keywords         ; A bit silly but my headers are now
   'org-mode `(("^\\*+ \\(TODO\\) " ; shorter, and that is nice canceled
                (1 (progn (compose-region (match-beginning 1) (match-end 1) "⚑")
                          nil)))
               ("^\\*+ \\(DOING\\) "
                (1 (progn (compose-region (match-beginning 1) (match-end 1) "⚐")
                          nil)))
               ("^\\*+ \\(CANCELED\\) "
                (1 (progn (compose-region (match-beginning 1) (match-end 1) "✘")
                          nil)))
               ("^\\*+ \\(DONE\\) "
                (1 (progn (compose-region (match-beginning 1) (match-end 1) "✔")
                          nil)))))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((shell      . t)
     (js         . t)
     (emacs-lisp . t)
     (clojure    . t)
     (python     . t)
     (ruby       . t)
     (dot        . t)
     (css        . t)
     (ditaa      . t)))
  (org-clock-persistence-insinuate)
  (define-key org-mode-map (kbd "M-C-n") 'org-end-of-item-list)
  (define-key org-mode-map (kbd "M-C-p") 'org-beginning-of-item-list)
  (define-key org-mode-map (kbd "M-C-u") 'outline-up-heading)
  (define-key org-mode-map (kbd "M-C-w") 'org-table-copy-region)
  (define-key org-mode-map (kbd "M-C-y") 'org-table-paste-rectangle)

  (define-key org-mode-map [remap org-return] (lambda () (interactive)
                                                (if (org-in-src-block-p)
                                                    (org-return)
                                                  (org-return-indent))))

  )

(use-package org-bullets
  :ensure t
  :init (add-hook 'org-mode-hook 'org-bullets-mode))

(use-package org-journal
  :ensure t
  :init
  (setq org-journal-dir "~/journal/")
  (setq org-journal-date-format "#+TITLE: Journal Entry- %Y-%b-%d (%A)")
  (setq org-journal-time-format ""))

(defun get-journal-file-today ()
  "Return filename for today's journal entry."
  (let ((daily-name (format-time-string "%Y%m%d")))
    (expand-file-name (concat org-journal-dir daily-name))))

(defun journal-file-today ()
  "Create and load a journal file based on today's date."
  (interactive)
  (find-file (get-journal-file-today)))

(defun get-journal-file-yesterday ()
  "Return filename for yesterday's journal entry."
  (let ((daily-name (format-time-string "%Y%m%d" (time-subtract (current-time) (days-to-time 1)))))
    (expand-file-name (concat org-journal-dir daily-name))))

(defun journal-file-yesterday ()
  "Creates and load a file based on yesterday's date."
  (interactive)
  (find-file (get-journal-file-yesterday)))

(defun journal-file-insert ()
  "Insert's the journal heading based on the file's name."
  (interactive)
  (when (string-match "\\(20[0-9][0-9]\\)\\([0-9][0-9]\\)\\([0-9][0-9]\\)" (buffer-name))
    (let ((year  (string-to-number (match-string 1 (buffer-name))))
          (month (string-to-number (match-string 2 (buffer-name))))
          (day   (string-to-number (match-string 3 (buffer-name))))
          (datim nil))
      (setq datim (encode-time 0 0 0 day month year))
      (insert (format-time-string org-journal-date-format datim))
      (insert "\n\n"))))  ; Start with a blank separating line
