;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Add .emacs.d/local to load-path
(add-to-list 'load-path (concat user-emacs-directory "local"))

;; Add every subdirectory of ~/.emacs.d/vendor to the load path
(dolist
    (project (directory-files (concat user-emacs-directory "vendor") t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))

;;
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(package-initialize)

(setq custom-file (concat user-emacs-directory "conf.d/customize.el"))

(let ((user-info "~/.emacs.d/.user-info"))
  (when (file-exists-p user-info)
    (load user-info)))

(dolist
    (config (directory-files (concat user-emacs-directory "conf.d") t "\\w+\\.el\\'"))
  (unwind-protect
    (let (retval)
      (condition-case ex
          (load-file config)
        ('error (message (format "Caught exception: [%s]" ex))))
        retval)))
