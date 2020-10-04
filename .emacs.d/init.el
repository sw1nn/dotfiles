(setq sw1nn/emacs-start-time (float-time))

(setq package-enable-at-startup nil)

(setq max-lisp-eval-depth 5000)

;; we don't use customize, but we want to keep this file clean.
(setq custom-file (expand-file-name ".customize.el" user-emacs-directory ))

(package-initialize)

(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://github.com/quelpa/quelpa/raw/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade))

  (quelpa
   '(quelpa-use-package
     :fetcher git
     :url "https://github.com/quelpa/quelpa-use-package.git")))

(require 'quelpa-use-package)
(setq quelpa-use-package-inhibit-loading-quelpa t);; disable updates
(quelpa-use-package-activate-advice)

(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(unless package-archive-contents
  (package-refresh-contents))

(require 'package)

(unless (package-installed-p 'diminish)
  (package-install 'diminish))

(unless (package-installed-p 'bind-key)
  (package-install 'bind-key))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-always-defer t
      use-package-always-ensure t
      use-package-always-pin "melpa-stable")

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
(add-hook 'emacs-startup-hook (lambda () (message "Emacs startup in %.2fs" (- (float-time) sw1nn/emacs-start-time))))
