;; -*- lexical-binding: t; -*-

(defvar org-export-output-directory-prefix "/home/neale/Downloads/tmp/" "prefix of directory used for org-mode export")

(advice-add 'org-export-output-file-name :around
            (lambda (orig-fn extension &optional subtreep pub-dir)
              (when (not pub-dir)
                (let ((pub-dir (concat org-export-output-directory-prefix (substring extension 1))))
                  (when (not (file-directory-p pub-dir))
                    (make-directory pub-dir))
                  (funcall orig-fn extension subtreep pub-dir)))))

(setq org-file-apps
      (quote
       ((auto-mode . emacs)
        ("\\.mm\\'" . default)
        ("\\.x?html?\\'" . "x-www-browser file://%s")
        ("\\.pdf\\'" . "x-www-browser file://%s"))))
