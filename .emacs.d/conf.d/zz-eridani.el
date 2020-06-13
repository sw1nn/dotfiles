;; -*- lexical-binding: t; -*-

(when (string= (system-name) "eridani")
  (setq temporary-file-directory "/home/neale/Downloads/tmp/")
  (defvar org-export-output-directory-prefix "/home/neale/Downloads/tmp/" "prefix of directory used for org-mode export")

  (advice-add 'org-export-output-file-name :around
	      (lambda (orig-fn extension &optional subtreep pub-dir)
		(when (not pub-dir)
		  (let ((pub-dir (concat org-export-output-directory-prefix (substring extension 1))))
		    (when (not (file-directory-p pub-dir))
		      (make-directory pub-dir))
		    (funcall orig-fn extension subtreep pub-dir))))))
