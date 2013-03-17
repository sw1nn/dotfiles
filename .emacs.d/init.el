;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Add .emacs.d/local to load-path
(add-to-list 'load-path (concat user-emacs-directory "local"))

;; Add every subdirectory of ~/.emacs.d/vendor to the load path
(dolist
    (project (directory-files (concat user-emacs-directory "vendor") t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

(require 'package)
(dolist (source '(;; ("melpa" . "http://melpa.milkbox.net/packages/")
                  ("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))
(package-initialize)

(require 'clojure-mode)

(require 'ac-nrepl)

(require 'nrepl)

(require 'expand-region)

(require 'align-cljlet)

(require 'linum-off)

(require 'ibuffer-git)

(require 'volatile-highlights)

(require 'git-gutter-fringe)

(require 'flyspell)

(require 'powerline)

(dolist 
    (config (directory-files (concat user-emacs-directory "conf.d") t "\\w+"))
  (load-file config))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(inferior-lisp-program "lein repl")
 '(ispell-program-name "/usr/bin/aspell")
 '(mainline-arrow-shape (quote chamfer)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foundry "unknown" :family "DejaVu Sans Mono for Powerline")))))
