;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Add .emacs.d/local to load-path
(require 'package)

(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")
                  ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
                  ("melpa" . "http://melpa.milkbox.net/packages/")))
  (add-to-list 'package-archives source t))

(add-to-list 'load-path (concat user-emacs-directory "local"))

(package-initialize t)
(package-refresh-contents)

(setq custom-file (concat user-emacs-directory "conf.d/customize.el"))

(let ((user-info "~/.emacs.d/.user-info"))
  (when (file-exists-p user-info)
    (load user-info)))

(add-hook 'after-init-hook
	  (lambda ()
	    (require 'use-package)
	    (require 'diminish)
	    (require 'bind-key)
	    (dolist
		(config (directory-files (concat user-emacs-directory "conf.d") t "\\w+\\.el\\'"))
	      (unwind-protect
		  (let (retval)
		    (condition-case ex
			(load-file config)
		      ('error (message (format "Caught exception: [%s]" ex))))
		    retval)))))
