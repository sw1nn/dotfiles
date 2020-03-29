(use-package smartparens
  :config
  (require 'smartparens-config)
  (add-to-list 'sp-smartparens-bindings '("M-?" . sp-convolute-sexp))
  (sp-use-smartparens-bindings)
  (sp-pair "(" ")" :wrap "M-(")
  (sp-pair "{" "}" :wrap "M-{"))

(use-package clojure-mode)

(use-package rainbow-delimiters)

(use-package clj-refactor
  :diminish clj-refactor-mode)

;; (use-package core-async-mode
;;   :diminish core-async-mode)

;; (use-package cider-eval-sexp-fu
;;   :pin melpa-stable
;;   :ensure t)

;; (use-package flycheck-clojure
;;   :ensure t
;;   :init
;;   (add-hook 'after-init-hook 'global-flycheck-mode)
;;   :config
;;   (use-package flycheck
;;     :config
;;     (flycheck-clojure-setup)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; lisp mode tweaks

(defun neale-custom-lisp-mode ()
  (show-paren-mode)
  (aggressive-indent-mode)
  (define-key aggressive-indent-mode-map (kbd "C-c C-q") nil) ;; clashes with cider
  (smartparens-strict-mode)
  (rainbow-identifiers-mode t)
  (eldoc-mode)
  (define-key emacs-lisp-mode-map (kbd "C-x C-e") 'pp-eval-last-sexp))

(defun neale-custom-clojure-mode ()
  (neale-custom-lisp-mode)
  (sw1nn/add-clj-compile-on-save)
  (yas-minor-mode t)
  (clj-refactor-mode t)
  (cljr-add-keybindings-with-prefix "C-c r")
  (define-key clojure-mode-map (kbd "RET") 'electrify-return-if-match)
  (define-key clojure-mode-map (kbd "M-{") 'paredit-wrap-curly)
  (define-key clojure-mode-map (kbd "M-t") 'sw1nn/transpose-kebab-words))

(defun neale-custom-cider-mode ()
  (neale-custom-lisp-mode))

(defun neale-custom-inferior-lisp-mode ()
  (neale-custom-lisp-mode))

(add-hook 'cider-repl-mode-hook #'neale-custom-cider-mode)
(add-hook 'lisp-mode-hook #'neale-custom-lisp-mode)
(add-hook 'emacs-lisp-mode-hook #'neale-custom-lisp-mode)
(add-hook 'clojure-mode-hook #'neale-custom-clojure-mode)
(add-hook 'inferior-lisp-mode-hook #'neale-custom-inferior-lisp-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (put-clojure-indent 'go-loop 'defun)

;; ;; these make om-tools defcomponentk 'better'
;; (put-clojure-indent 'display-name 'defun)
;; (put-clojure-indent 'render 'defun)
;; (put-clojure-indent 'render-state 'defun)
;; (put-clojure-indent 'will-mount 'defun)
;; (put-clojure-indent 'did-mount 'defun)
;; (put-clojure-indent 'did-update 'defun)

;; (global-prettify-symbols-mode 1)
;; (defvar sw1nn/clojure-prettify-alist '())

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; font-lock tweaks
;; (dolist (mode '(clojure-mode clojurescript-mode cider-mode))
;;   (eval-after-load mode
;;     '(setq clojure--prettify-symbols-alist
;;           (append sw1nn/clojure-prettify-alist
;;                   clojure--prettify-symbols-alist))))
