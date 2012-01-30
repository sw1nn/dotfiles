;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; local (non-elpa) stuff's in here
(add-to-list 'load-path "~/.emacs.d/local")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; pick a emacs-23 version of package if it's not available

(when (not (require 'package nil t))
  (require 'package "package-23.el")
  (package-initialize))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; look and feel tweaks
(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 232))
(setq linum-format "%3d")
(global-linum-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Key binding tweaks
(global-unset-key (kbd "C-\\")) ; remove annoying input-method binding.
(global-unset-key (kbd "s-p")) ; remove print binding
(put 'toggle-input-method 'disabled nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; load local (non-elpa) modules

(require 'auto-complete-config)
(require 'htmlize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; file associations
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Auto complete config
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict") (ac-config-default)
(ac-set-trigger-key "TAB")
(setq ac-auto-start nil)
(ac-config-default)

;; note: may have to amend for unicode project names
(add-to-list 'same-window-regexps "\\*magit: [[:ascii:]]\\*")

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (if (fboundp 'magit-completing-read-function) 
         (setq magit-completing-read-function 'ido-completing-read))))


(defun clojure-jack-in-once ()
  "clojure-jack-in if it hasn't been run already, as indicated by presence of *swank* buffer"
  (let ((proc (get-buffer-process "*swank*")))
    (unless (and proc (eq (process-status proc) 'run))
      (clojure-jack-in))))

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

(eval-after-load 'slime-repl-mode
  '(font-lock-add-keywords
    'slime-repl-mode 'fancy-formatting-defs))

(defun neale-custom-lisp-mode ()
  (setq cursor-type 'bar)
  (set-cursor-color "green")
  (rainbow-delimiters-mode 1)
  (show-paren-mode 0)
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
  ;(clojure-jack-in-once)
  )

(defun neale-custom-slime-repl-mode () 
  (neale-custom-lisp-mode)
  (define-key slime-repl-mode-map
    (kbd "DEL") 'paredit-backward-delete)
  (define-key slime-repl-mode-map
    (kbd "{") 'paredit-open-curly)
  (define-key slime-repl-mode-map
    (kbd "}") 'paredit-close-curly)
)

(defun neale-custom-inferior-lisp-mode () 
  (neale-custom-lisp-mode)
  (define-key inferior-lisp-mode-map
    (kbd "DEL") 'paredit-backward-delete)
  (define-key inferior-lisp-mode-map
    (kbd "{") 'paredit-open-curly)
  (define-key inferior-lisp-mode-map
    (kbd "}") 'paredit-close-curly)
)

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
 '(inferior-lisp-program "lein repl"))

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
 '(region ((t (:background "#444444")))))
