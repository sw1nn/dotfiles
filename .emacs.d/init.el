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

(package-initialize)

(setq custom-file (concat user-emacs-directory "conf.d/customize.el"))

(dolist
    (config (directory-files (concat user-emacs-directory "conf.d") t "\\w+\\.el\\'"))
  (load-file config))
