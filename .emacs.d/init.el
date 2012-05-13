;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; local (non-elpa) stuff's in here
(add-to-list 'load-path "~/.emacs.d/local" )
(add-to-list 'load-path "~/dotfiles/submodule/clojure-mode")
(add-to-list 'load-path "~/dotfiles/submodule/yasnippet")

;;;;;;;;;;;;;;;;;core;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; pick a emacs-23 version of package if it's not available

(when (not (require 'package nil t))
   (require 'package "package-23.el")
   (package-initialize))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; look and feel tweaks
(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 232))
(setq linum-format "%3d")
(global-linum-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; load local (non-elpa) modules

(require 'auto-complete-config)
(require 'htmlize)
(require 'yaml-mode)
(require 'haml-mode)
(require 'sass-mode)
(require 'clojure-mode)
(require 'clojurescript-mode)
;(require 'clojure-test-mode)
(require 'octopress)
(require 'yasnippet)
(yas/global-mode 1)
(setq yas/prompt-functions '(yas/ido-prompt)) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; file associations
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.yml" . yaml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.scss" . sass-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.m" . octave-mode) auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Auto complete config
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict") 
(ac-config-default)
(ac-set-trigger-key "TAB")
(setq ac-auto-start nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; misc settings
(setq-default ispell-program-name "/usr/local/bin/aspell")
(setq-default ispell-list-command "list")

;; note: may have to amend for unicode project names
(add-to-list 'same-window-regexps "\\*magit: [[:ascii:]]\\*")

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (if (fboundp 'magit-completing-read-function) 
         (setq magit-completing-read-function 'ido-completing-read))))


(defun clojure-jack-in-once ()
  "clojure-jack-in unless we're already connected"
  (unless (and (featurep 'slime) (slime-connected-p))
    (clojure-jack-in)))

(defconst fancy-formatting-defs
  '(("(\\(fn\\)[\[[:space:]]"
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
               nil)))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode fancy-formatting-defs))

(eval-after-load 'clojurescript-mode
  '(font-lock-add-keywords
    'clojurescript-mode fancy-formatting-defs))

(eval-after-load 'slime-repl-mode
  '(font-lock-add-keywords
    'slime-repl-mode 'fancy-formatting-defs))

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
  (flyspell-prog-mode))

(defun neale-custom-clojure-mode () 
  (neale-custom-lisp-mode)
;  (clojure-jack-in-once)
  )

(defun neale-custom-slime-repl-mode () 
  (neale-custom-lisp-mode)
  (define-key slime-repl-mode-map
    (kbd "DEL") 'paredit-backward-delete)
  (define-key slime-repl-mode-map
    (kbd "{") 'paredit-open-curly)
  (define-key slime-repl-mode-map
    (kbd "}") 'paredit-close-curly))

(defun neale-custom-inferior-lisp-mode () 
  (neale-custom-lisp-mode)
  (define-key inferior-lisp-mode-map
    (kbd "DEL") 'paredit-backward-delete)
  (define-key inferior-lisp-mode-map
    (kbd "{") 'paredit-open-curly)
  (define-key inferior-lisp-mode-map
    (kbd "}") 'paredit-close-curly))

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'neale-custom-slime-repl-mode)
(add-hook 'emacs-lisp-mode-hook 'neale-custom-lisp-mode)
(add-hook 'clojure-mode-hook 'neale-custom-clojure-mode)
(add-hook 'inferior-lisp-mode-hook 'neale-custom-inferior-lisp-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-matching-paren-on-screen t)
 '(dired-use-ls-dired nil)
 '(frame-background-mode nil)
 '(ido-enable-flex-matching t)
 '(inferior-lisp-program "lein repl")
 '(recenter-positions (quote (0.2 0.4 0.6 0.8 bottom top)))
 '(visible-bell nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#101010" :foreground "wheat" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "apple" :family "Monaco"))))
 '(hl-line ((t (:background "#002000"))))
 '(magit-item-highlight ((t (:inherit highlight :background "#002000"))))
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

