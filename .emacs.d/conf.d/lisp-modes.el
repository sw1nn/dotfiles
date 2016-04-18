(use-package clojure-mode
  :pin melpa-stable
  :ensure t)

(use-package rainbow-identifiers
  :pin melpa-stable
  :ensure t)

(use-package multiple-cursors
  :ensure t)

(use-package clj-refactor
  :pin melpa-stable
  :diminish clj-refactor-mode
  :ensure t)

(use-package core-async-mode
  :diminish core-async-mode)

(use-package highlight
  :pin melpa-stable
  :ensure t)

(use-package eval-sexp-fu
  :pin melpa-stable
  :ensure t)

(use-package aggressive-indent
  :pin melpa-stable
  :ensure t)

(use-package flycheck-clojure
  :pin melpa
  :ensure t
  :config
  (eval-after-load 'flycheck '(flycheck-clojure-setup))
  :init
  (global-flycheck-mode))

(use-package flycheck-pos-tip
  :pin melpa-stable
  :ensure t
  :config
  (eval-after-load 'flycheck
    '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; lisp mode tweaks

(defvar electrify-return-match
  "[\]}\)\"]"
  "If this regexp matches the text after the cursor, do an \"electric\"
  return.")

(defun electrify-return-if-match (arg)
  "If the text after the cursor matches `electrify-return-match' then
  open and indent an empty line between the cursor and the text.  Move the
  cursor to the new line."
  (interactive "P")
  (let ((case-fold-search nil))
    (if (looking-at electrify-return-match)
        (save-excursion (newline-and-indent)))
    (newline arg)
    (indent-according-to-mode)))

(defun neale-custom-lisp-mode ()
  (paredit-mode t)
  (flyspell-prog-mode)
  (yas-minor-mode)
  (show-paren-mode)
  (aggressive-indent-mode)
  (define-key aggressive-indent-mode-map (kbd "C-c C-q") nil) ;; clashes with cider
  (eldoc-mode)
  (define-key emacs-lisp-mode-map (kbd "C-x C-e") 'pp-eval-last-sexp)
  )

(defun neale-custom-clojure-mode ()
  (neale-custom-lisp-mode)
  (sw1nn-add-clj-compile-on-save)
  (hs-minor-mode t)
  (clj-refactor-mode t)
  (core-async-mode t)
  (cljr-add-keybindings-with-prefix "C-c r")
  (rainbow-identifiers-mode t)
  (define-key clojure-mode-map (kbd "RET") 'electrify-return-if-match)
  (define-key clojure-mode-map (kbd "M-{") 'paredit-wrap-curly)
  (define-key clojure-mode-map (kbd "M-t") 'sw1nn-transpose-kebab-words)
  (define-key paredit-mode-map (kbd "M-r") nil) ;; remove very rude paredit binding.
  (define-key paredit-mode-map (kbd "C-c a") 'align-cljlet)
  (set (make-local-variable 'font-lock-extra-managed-props) '(composition)) ; revert fancy characters.
  )

(defun neale-custom-cider-mode ()
  (neale-custom-lisp-mode))

(defun neale-custom-inferior-lisp-mode ()
  (neale-custom-lisp-mode))

(setq nrepl-sync-request-timeout nil)

(add-hook 'cider-repl-mode-hook 'neale-custom-cider-mode)
(add-hook 'lisp-mode-hook 'neale-custom-lisp-mode)
(add-hook 'emacs-lisp-mode-hook 'neale-custom-lisp-mode)
(add-hook 'clojure-mode-hook 'neale-custom-clojure-mode)
(add-hook 'inferior-lisp-mode-hook 'neale-custom-inferior-lisp-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (put-clojure-indent 'go-loop 'defun)

;; ;; these make om-tools defcomponentk 'better'
;; (put-clojure-indent 'display-name 'defun)
;; (put-clojure-indent 'render 'defun)
;; (put-clojure-indent 'render-state 'defun)
;; (put-clojure-indent 'will-mount 'defun)
;; (put-clojure-indent 'did-mount 'defun)
;; (put-clojure-indent 'did-update 'defun)

(global-prettify-symbols-mode 1)
(defvar sw1nn/clojure-prettify-alist '())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; font-lock tweaks
(dolist (mode '(clojure-mode clojurescript-mode cider-mode))
  (eval-after-load mode
    '(setq clojure--prettify-symbols-alist
          (append sw1nn/clojure-prettify-alist
                  clojure--prettify-symbols-alist))))
