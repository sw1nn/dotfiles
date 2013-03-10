;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/local" ) ; local (non-elpa)
                                        ; stuff's in here
(add-to-list 'load-path "~/dotfiles/submodule/expand-region" )

(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/")
             ;; '("marmalade" . "http://marmalade-repo.org/packages/")
             )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; look and feel tweaks
(add-to-list 'default-frame-alist '(height . 55))
(add-to-list 'default-frame-alist '(width . 212))

(load-theme 'sanityinc-solarized-dark t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Local requires

(require 'expand-region)

(require 'align-cljlet)

(require 'linum-off)

(require 'ibuffer-git)

(require 'ace-jump-mode)

(require 'volatile-highlights)

(require 'git-gutter-fringe)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ibuffer tweaks

;;nicely format the ibuffer and include git-status
(setq ibuffer-formats '((mark modified read-only git-status-mini " "
      (name 18 18 :left :elide)
      " "
      (size 9 -1 :right)
      " "
      (git-status 8 8 :left :elide)
      " "
      (mode 16 16 :left :elide)
      " " filename-and-process)))


(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-auto-mode 1)
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; pastebin

(let ((auth-file "~/.emacs.d/.pastebin-auth"))
  (when (file-exists-p auth-file)
    (require 'pastebin)
    (load auth-file)
    (pastebin-login)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; refheap

(let ((auth-file "~/.emacs.d/.refheap-auth"))
  (when (file-exists-p auth-file)
    (require 'refheap)
    (load auth-file)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; w3m tweaks

(defun w3m-browse-url-other-window (url &optional newwin)
  (let ((w3m-pop-up-windows t))
    (if (one-window-p) (split-window-horizontally))
    (other-window 1)
    (w3m-browse-url url newwin)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; file associations
(dolist (mode '(("\\.md\\$" . markdown-mode)
                ("\\.markdown\\$" . markdown-mode)
                ("\\.yml\\$" . yaml-mode)
                ("\\.scss\\$" . sass-mode)
                ("\\.m\\$" . octave-mode)))
  (add-to-list 'auto-mode-alist mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto complete config
(require 'auto-complete-config) 
(ac-config-default)
(ac-flyspell-workaround)

(set-default 'ac-sources
             '(ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers))

(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                lisp-mode textile-mode markdown-mode tuareg-mode nrepl-mode))
  (add-to-list 'ac-modes mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ERC Tweaks

;; Load authentication info from an external source.
(let ((auth-file "~/.emacs.d/.erc-auth"))
  (when (file-exists-p auth-file)
    (load auth-file)
    (require 'erc-services)
    (setq erc-email-user-id freenode-email-user-id)
    (setq erc-nickserv-passwords
          `((freenode (("sw1nn" . ,freenode-nickone-pass)))))))     

(require 'erc-highlight-nicknames)

;;; Finally, connect to the networks.
(defun irc-maybe ()
  (interactive)
  (when (y-or-n-p "IRC? ")
    (erc-ssl :server "irc.freenode.net" :port 6697 :nick "sw1nn" :full-name "Neale Swinnerton")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; nRepl tweaks
(setq nrepl-javadoc-local-paths (list "/usr/local/share/javadoc-w3m/7/docs/api"))

(add-to-list 'same-window-buffer-names "*nrepl*") 
(add-hook 'nrepl-interaction-mode-hook
          (lambda ()
            (nrepl-turn-on-eldoc-mode)
            (nrepl-ritz-break-on-exceptions t)
            (defun ns-interactive-eval-to-repl (form)
              (let ((buffer nrepl-nrepl-buffer))
                (nrepl-send-string form (nrepl-handler buffer) nrepl-buffer-ns)))

            (defun ns-eval-last-expression-to-repl ()
              (interactive)
              (ns-interactive-eval-to-repl (nrepl-last-expression)))
            (define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; font-lock tweaks
(dolist (mode '(clojure-mode clojurescript-mode nrepl-mode))
  (eval-after-load mode 
    (font-lock-add-keywords
     mode '(("(\\(fn\\)[\[[:space:]]"  ; anon funcs 1
             (0 (progn (compose-region (match-beginning 1)
                                       (match-end 1) "λ")
                       nil)))
            ("\\(#\\)("                ; anon funcs 2
             (0 (progn (compose-region (match-beginning 1)
                                       (match-end 1) "ƒ")
                       nil)))
            ("\\(#\\){"                 ; sets
             (0 (progn (compose-region (match-beginning 1)
                                       (match-end 1) "∈")
                       nil)))
            ("\\(#\\)\\(?:\\\".*?\\\"\\)"  ; regexes
             (0 (progn (compose-region (match-beginning 1)
                                       (match-end 1) "®")
                       nil)))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; lisp mode tweaks

(defun neale-custom-lisp-mode ()
  (rainbow-delimiters-mode t)
  (modify-syntax-entry ?\{ "(}")
  (modify-syntax-entry ?\} "){")
  (modify-syntax-entry ?\[ "(]")
  (modify-syntax-entry ?\] ")[")
  (modify-syntax-entry ?~ "'   ")
  (modify-syntax-entry ?, "    ")
  (modify-syntax-entry ?^ "'")
  (modify-syntax-entry ?= "'")
  (paredit-mode t)
  (flyspell-prog-mode)
  (yas-minor-mode))

(defun neale-custom-clojure-mode () 
  (neale-custom-lisp-mode)
;  (clojure-jack-in-once)
  )

(defun neale-custom-nrepl-mode () 
  (neale-custom-lisp-mode))

(defun neale-custom-inferior-lisp-mode () 
  (neale-custom-lisp-mode))

(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'clojure-nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-mode-hook 'neale-custom-nrepl-mode)
(add-hook 'lisp-mode-hook 'neale-custom-lisp-mode)
(add-hook 'emacs-lisp-mode-hook 'neale-custom-lisp-mode)
(add-hook 'clojure-mode-hook 'neale-custom-clojure-mode)
(add-hook 'inferior-lisp-mode-hook 'neale-custom-inferior-lisp-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 0.0)
 '(ac-comphist-file "~/.emacs.d/ac-comphist.dat")
 '(ac-dictionary-directories (quote ("~/.emacs.d/ac-dict" "/Users/neale/.emacs.d/elpa/auto-complete-20121022.2254/dict")))
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
 '(global-undo-tree-mode t)
 '(ibuffer-show-empty-filter-groups nil)
 '(ido-enable-flex-matching t)
 '(inferior-lisp-program "lein repl")
 '(ispell-program-name "/usr/bin/aspell")
 '(linum-disabled-modes-list (quote (eshell-mode wl-summary-mode compilation-mode org-mode text-mode dired-mode erc-mode)))
 '(linum-format "%03d ")
 '(pastebin-domain-versions (quote (("pastebin.com" "/api") ("pastebin.example.com" "/pastebin.php"))))
 '(nrepl-popup-stacktraces t)
 '(recenter-positions (quote (0.2 0.4 0.6 0.8 bottom top)))
 '(same-window-regexps (quote ("\\*magit: [[:ascii:]]\\*")))
 '(visible-bell nil)
 '(volatile-highlights-mode t))

(put 'downcase-region 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Key binding tweaks
; See
; http://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs

(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(define-key my-keys-minor-mode-map (kbd "C-\\") nil) ; remove annoying input-method binding.
(define-key my-keys-minor-mode-map (kbd "s-p") nil)  ; remove print binding
(define-key my-keys-minor-mode-map (kbd "M-TAB") 'yas/expand)
(define-key my-keys-minor-mode-map (kbd "<select>") 'windmove-up)
(define-key my-keys-minor-mode-map (kbd "C-x C-b") 'ibuffer)
(define-key my-keys-minor-mode-map (kbd "C-M-z") 'align-cljlet)
(define-key my-keys-minor-mode-map (kbd "C-=") 'er/expand-region)
(define-key my-keys-minor-mode-map (kbd "C-S-c C-S-c") 'mc/edit-lines)
(define-key my-keys-minor-mode-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key my-keys-minor-mode-map (kbd "C-c C-SPC") 'ace-jump-mode-pop-mark)
(define-key my-keys-minor-mode-map (kbd "M-SPC") (lambda () (interactive) (just-one-space -1)))
(define-key my-keys-minor-mode-map (kbd "C-M-g") 'magit-status)
(define-key my-keys-minor-mode-map (kbd "C-c g g") 'git-gutter:toggle)
(define-key my-keys-minor-mode-map (kbd "C-c g p") 'git-gutter:previous-diff)
(define-key my-keys-minor-mode-map (kbd "C-c g n") 'git-gutter:next-diff)
(define-key my-keys-minor-mode-map (kbd "C-c g d") 'git-gutter:popup-diff)
(define-key my-keys-minor-mode-map (kbd "C-c g r") 'git-gutter:revert-hunk)

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)

(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

(defadvice load (after give-my-keybindings-priority)
  "Try to ensure that my keybindings always have priority."
  (if (not (eq (car (car minor-mode-map-alist)) 'my-keys-minor-mode))
      (let ((mykeys (assq 'my-keys-minor-mode minor-mode-map-alist)))
        (assq-delete-all 'my-keys-minor-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))
(ad-activate 'load)

;; not sure why this has to go at the bottom. but it works here.
(require 'yasnippet)
(yas/reload-all)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#002b36" :foreground "#839496" :inverse-video nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "unknown" :family "DejaVu Sans Mono for Powerline"))))
 '(eldoc-highlight-function-argument ((t (:inherit bold :foreground "#859900"))))
 '(default ((t (:slant normal :weight normal :height 113 :width normal :foundry "unknown" :family "DejaVu Sans Mono for Powerline"))))
 '(eldoc-highlight-function-argument ((t (:inherit bold :foreground "#859900"))) t)
 '(idle-highlight ((t (:inverse-video t)))))
