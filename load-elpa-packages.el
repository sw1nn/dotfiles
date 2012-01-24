(progn
  ;; From https://github.com/technomancy/emacs-starter-kit
  ;; Add Marmalade as a package archive source.
  (require 'package)
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (package-initialize)

  (when (not package-archive-contents)
    (package-refresh-contents))

  ;; Add in your own as you wish:
  (defvar my-packages '(starter-kit
                        ;; starter-kit-lisp
                        starter-kit-bindings
                        clojure-mode
                        clojure-test-mode
                        clojurescript-mode
                        ac-slime
                        rainbow-delimiters
                        markdown-mode
                        )
    "A list of packages to ensure are installed at launch.")  
  
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p)))
  )
