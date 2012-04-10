(progn
  ;; From https://github.com/technomancy/emacs-starter-kit
  ;; Add Marmalade as a package archive source.

  (add-to-list 'load-path "~/.emacs.d/local")

  ;; pick a emacs-23 version of package if it's not available
  (when (not (require 'package nil t))
      (require 'package "package-23.el"))

  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (package-initialize)

  (when (not package-archive-contents)
    (package-refresh-contents))

  ;; Add in your own as you wish:
  (defvar my-packages '(starter-kit
                        ;; starter-kit-lisp
                        starter-kit-bindings
                        ac-slime
                        rainbow-delimiters
                        markdown-mode
                        magit
                        slime
                        slime-repl
                        )
    "A list of packages to ensure are installed at launch.") 
  
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))
