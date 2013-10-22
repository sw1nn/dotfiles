;; need to do config after (package-initialize). See How Packages work in Emacs 24 - http://www.emacswiki.org/emacs/ELPA#toc4
(add-hook 'after-init-hook '(lambda nil (load-file (concat user-emacs-directory "my-init.el"))))
