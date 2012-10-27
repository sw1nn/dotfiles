;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; local (non-elpa) stuff's in here
(add-to-list 'load-path "~/.emacs.d/local" )

(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; look and feel tweaks
(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 232))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; file associations
(dolist (mode '(("\\.md" . markdown-mode)
                ("\\.markdown" . markdown-mode)
                ("\\.yml" . yaml-mode)
                ("\\.scss" . sass-mode)
                ("\\.m" . octave-mode)))
  (add-to-list 'auto-mode-alist mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Auto complete config
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
                lisp-mode textile-mode markdown-mode tuareg-mode))
  (add-to-list 'ac-modes mode))

;; Load authentication info from an external source.  Put sensitive
     ;; passwords and the like in here.
(let ((auth-file "~/.emacs.d/.erc-auth"))
  (when (file-exists-p auth-file)
    (load auth-file)
    (require 'erc-services)
    (setq erc-nickserv-passwords
          `((freenode (("sw1nn" . ,freenode-nickone-pass)))))))     

;;; Finally, connect to the networks.
(defun irc-maybe ()
(interactive)
  (when (y-or-n-p "IRC? ")
    (erc-ssl :server "irc.freenode.net" :port 6697 :nick "sw1nn" :full-name "Neale Swinnerton")))

(dolist (mode '(clojure-mode clojurescript-mode nrepl-mode))
  (eval-after-load mode 
    (font-lock-add-keywords
     mode '(("(\\(fn\\)[\[[:space:]]"
             (0 (progn (compose-region (match-beginning 1)
                                       (match-end 1) "λ")
                       nil)))
            ("\\(#\\)("
             (0 (progn (compose-region (match-beginning 1)
                                       (match-end 1) "ƒ")
                       nil)))
            ("\\(#\\){"
             (0 (progn (compose-region (match-beginning 1)
                                       (match-end 1) "∈")
                       nil)))))))

(defun neale-custom-lisp-mode ()
  (setq cursor-type 'bar)
  (set-cursor-color "green")
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
  (yas-minor-mode)
  (linum-mode))

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 0.0)
 '(ac-comphist-file "~/.emacs.d/ac-comphist.dat")
 '(ac-dictionary-directories (quote ("~/.emacs.d/ac-dict" "/Users/neale/.emacs.d/elpa/auto-complete-20121022.2254/dict")))
 '(blink-matching-paren-on-screen t)
 '(dired-use-ls-dired nil)
 '(erc-autojoin-channels-alist (quote (("freenode.net" "#clojure"))))
 '(erc-email-userid "neale@isismanor.com")
 '(erc-hide-list (quote ("NICK" "PART" "QUIT")))
 '(erc-modules (quote (autojoin button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring scrolltobottom services stamp track)))
 '(erc-nick "sw1nn")
 '(erc-port 6697)
 '(erc-prompt-for-nickserv-password nil)
 '(erc-prompt-for-password nil)
 '(erc-scrolltobottom-mode t)
 '(erc-track-exclude-types (quote ("NICK" "PART" "QUIT" "333" "353")))
 '(erc-user-full-name "Neale Swinnerton")
 '(frame-background-mode nil)
 '(global-auto-complete-mode t)
 '(global-undo-tree-mode t)
 '(ido-enable-flex-matching t)
 '(inferior-lisp-program "lein repl")
 '(ispell-program-name "/usr/local/bin/aspell")
 '(linum-format "%03d ")
 '(recenter-positions (quote (0.2 0.4 0.6 0.8 bottom top)))
 '(same-window-regexps (quote ("\\*magit: [[:ascii:]]\\*")))
 '(visible-bell nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#101010" :foreground "wheat" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "apple" :family "Monaco"))))
 '(hl-line ((t (:background "#002000"))))
 '(magit-item-highlight ((t (:inherit highlight :background "#001000"))))
 '(mode-line ((t (:background "#003000" :foreground "wheat" :box (:line-width -1 :style released-button)))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "red"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "coral"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "turquoise1"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "maroon1"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "yellow1"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "turquoise1"))))
 '(rainbow-delimiters-unmatched-face ((t (:background "Red" :foreground "White" :box (:line-width 2 :color "grey75" :style released-button) :weight ultra-bold))))
 '(region ((t (:background "#444444"))))
 '(show-paren-match ((t (:inverse-video t)))))
(put 'downcase-region 'disabled nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Key binding tweaks
; See
; http://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs

(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(define-key my-keys-minor-mode-map (kbd "C-\\") nil) ; remove annoying input-method binding.
(define-key my-keys-minor-mode-map (kbd "s-p") nil)  ; remove print binding
(define-key my-keys-minor-mode-map (kbd "C-M-g") 'magit-status)
(define-key my-keys-minor-mode-map (kbd "M-TAB") 'yas/expand)
(define-key my-keys-minor-mode-map (kbd "<select>") 'windmove-up)

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
