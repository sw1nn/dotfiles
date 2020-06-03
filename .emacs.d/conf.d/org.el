;; https://github.com/howardabrams/dot-files/blob/master/emacs-org.org

(use-package org
  :hook (org-mode . yas-minor-mode-on)
  :init
  (setq   org-agenda-files "~/org/agenda/active-agendas"
	  org-confirm-babel-evaluate nil
	  org-default-notes-file "~/org/notes.org"
	  org-ditaa-jar-path "/usr/share/java/ditaa/ditaa-0_10.jar"
	  org-hide-emphasis-markers t
	  org-latex-compiler "xelatex"
	  org-log-done (quote time)
	  org-log-into-drawer t
	  org-log-reschedule (quote note)
	  org-outline-path-complete-in-steps nil
	  org-refile-allow-creating-parent-nodes (quote confirm)
	  org-refile-targets (quote ((org-agenda-files :maxlevel . 1)))
	  org-refile-use-outline-path (quote file)
	  org-src-fontify-natively t ;; Pretty code blocks
	  org-src-tab-acts-natively t
	  org-todo-keywords '((sequence "TODO(t)" "DOING(g)" "|" "DONE(d)") (sequence "|" "CANCELED(c)"))
	  org-use-speed-commands t)
  :bind (("C-c o l" . org-store-link)
         ("C-c o a" . org-agenda)
         ("<f11>" . org-capture)
         ("C-M-|" . indent-rigidly)
         ("C-c o y" . journal-file-yesterday)
         ("C-c o j" . journal-file-today)
	 :map org-mode-map (("M-C-n" . org-end-of-item-list)
			    ("M-C-p" . org-beginning-of-item-list)
			    ("M-C-u" . outline-up-heading)
			    ("M-C-w" . org-table-copy-region)
			    ("M-C-y" . org-table-paste-rectangle)))
  :config
  (define-key org-mode-map [remap org-return] (lambda () (interactive) ;; why can't this go in the :bind above?
						(if (org-in-src-block-p)
						    (org-return)
						  (org-return-indent))))
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
  (org-clock-persistence-insinuate))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(use-package org-journal
  :after autoinsert
  :init
  (setq org-journal-dir "~/journal"
	org-journal-date-format "#+TITLE: Journal Entry- %Y-%b-%d (%A)"
	org-journal-time-format "")
  (add-to-list 'auto-insert-alist
	       (cons (concat (expand-file-name org-journal-dir)
			     "/[0-9]\\{4\\}-\\(?:1[0-2]\\|0[1-9]\\)-\\(?:0[0-9]\\|2[0-9]\\|3[01]\\)\\.org")
		     'journal-file-insert)))

(defun get-journal-file (&optional time)
  (let ((auto-insert-query-old auto-insert-query)) ;; BUG race condition here?
    (setq auto-insert-query nil)
    (find-file (expand-file-name (format-time-string "/%Y-%m-%d.org" time) org-journal-dir))
    (setq auto-insert-query auto-insert-query-old)))

(defun journal-file-yesterday ()
  (interactive)
  (get-journal-file (time-subtract (current-time) (days-to-time 1))))

(defun journal-file-today ()
  (interactive)
  (get-journal-file))


(defun journal-file-insert ()
  "Insert's the journal heading based on the file's name."
  (interactive)
  (when (string-match "\\([0-9]\\{4\\}\\)-\\(1[0-2]\\|0[1-9]\\)-\\(0[0-9]\\|2[0-9]\\|3[01]\\)" (buffer-name))
    (let* ((year  (string-to-number (match-string 1 (buffer-name))))
	   (month (string-to-number (match-string 2 (buffer-name))))
	   (day   (string-to-number (match-string 3 (buffer-name))))
	   (datim (encode-time 0 0 0 day month year)))
      (insert (format-time-string org-journal-date-format datim))
      (insert "\n\n"))))  ; Start with a blank separating line
