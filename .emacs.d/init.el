(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://github.com/quelpa/quelpa/raw/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))

(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))
;;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(unless package-archive-contents
  (package-refresh-contents))

(require 'package)

(unless (package-installed-p 'diminish)
  (package-install 'diminish))

(unless (package-installed-p 'bind-key)
  (package-install 'bind-key))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(add-to-list 'load-path "~/.emacs.d/local")

;; ensures that we have the features `use-package' requires:
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(let ((user-info "~/.emacs.d/.user-info"))
  (when (file-exists-p user-info)
    (load user-info)))

(defun load-file-timed (config)
  (let ((start (float-time)))
    (load-file config)
    (message "%s took %fms" config (* (- (float-time) start) 1000))))

(defun load-all-config-files ()
  "Load all files in %emacs%/conf.d."
  (dolist
      (config (directory-files (concat user-emacs-directory "conf.d") t "\\w+\\.el\\'"))
    (unwind-protect
	(let (retval)
	  (condition-case ex
	      (load-file-timed config)
	    ('error (message (format "Caught exception: [%s]" ex))))
	  retval))))

(add-hook 'after-init-hook #'load-all-config-files)
