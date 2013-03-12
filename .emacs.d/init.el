;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ELPA
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(setq package-user-dir (concat dotfiles-dir "elpa"))

;; Add .emacs.d/local to load-path
(add-to-list 'load-path (concat dotfiles-dir "local"))

;; Add every subdirectory of ~/.emacs.d/vendor to the load path
(dolist
    (project (directory-files (concat dotfiles-dir "vendor") t "\\w+"))
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

(dolist 
    (config (directory-files (concat dotfiles-dir "conf.d") t "\\w+"))
  (load-file config))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 0.0)
 '(ac-comphist-file "~/.emacs.d/ac-comphist.dat")
 '(blink-matching-paren-on-screen t)
 '(browse-url-browser-function (quote w3m-browse-url-other-window))
 '(custom-safe-themes (quote ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(dired-use-ls-dired nil)
 '(erc-autojoin-channels-alist (quote (("freenode.net" "#clojure"))))
 '(erc-hide-list (quote ("JOIN" "NICK" "PART" "QUIT")))
 '(erc-modules (quote (autojoin button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring scrolltobottom services stamp track highlight-nicknames)))
 '(erc-nick "sw1nn")
 '(erc-port 6697)
 '(erc-prompt-for-nickserv-password nil)
 '(erc-prompt-for-password nil)
 '(erc-scrolltobottom-mode t)
 '(erc-track-exclude-types (quote ("NICK" "PART" "QUIT" "333" "353")))
 '(erc-user-full-name "Neale Swinnerton")
 '(git-gutter-fr:side (quote left-fringe))
 '(global-auto-complete-mode t)
 '(global-git-gutter-mode t)
 '(global-linum-mode t)
 '(global-undo-tree-mode t)
 '(ibuffer-show-empty-filter-groups nil)
 '(ido-enable-flex-matching t)
 '(inferior-lisp-program "lein repl")
 '(ispell-program-name "/usr/bin/aspell")
 '(linum-disabled-modes-list (quote (eshell-mode wl-summary-mode compilation-mode org-mode text-mode dired-mode erc-mode)))
 '(linum-format "%03d ")
 '(pastebin-domain-versions (quote (("pastebin.com" "/api") ("pastebin.example.com" "/pastebin.php"))))
 '(recenter-positions (quote (0.2 0.4 0.6 0.8 bottom top)))
 '(same-window-regexps (quote ("\\*magit: [[:ascii:]]\\*")))
 '(visible-bell nil)
 '(volatile-highlights-mode t)
 '(winner-mode t nil (winner)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foundry "unknown" :family "DejaVu Sans Mono for Powerline"))))
 '(eldoc-highlight-function-argument ((t (:inherit bold :foreground "#859900"))))
 '(git-gutter-fr:modified ((t (:foreground "#d33682" :weight bold))))
 '(idle-highlight ((t (:inverse-video t)))))
