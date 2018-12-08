(package-initialize)
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

(unless (package-installed-p 'smex)
  (use-package smex))

(add-to-list 'load-path "~/.emacs.d/local")

;; (if (require 'quelpa nil t)
;;     (quelpa-self-upgrade)
;;   (with-temp-buffer
;;     (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
;;     (eval-buffer)))


;; ensures that we have the features `use-package' requires:
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(setq custom-file (concat user-emacs-directory "conf.d/00customize.el"))

(let ((user-info "~/.emacs.d/.user-info"))
  (when (file-exists-p user-info)
    (load user-info)))



(add-hook 'after-init-hook
      (lambda ()
            (dolist
                (config (directory-files (concat user-emacs-directory "conf.d") t "\\w+\\.el\\'"))
              (unwind-protect
                  (let (retval)
                    (condition-case ex
                        (load-file config)
                      ('error (message (format "Caught exception: [%s]" ex))))
                    retval)))))
