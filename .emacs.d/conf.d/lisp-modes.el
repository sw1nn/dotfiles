(require 'clojure-mode)
(require 'clojure-test-mode)

(require 'align-cljlet)

(require 'cider)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; font-lock tweaks
(dolist (mode '(clojure-mode clojurescript-mode cider-mode))
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
  (rainbow-delimiters-mode t)
  (paredit-mode t)
  (flyspell-prog-mode)
  (yas-minor-mode)
  (show-paren-mode)
  (eldoc-mode))

(defun neale-custom-clojure-mode ()
  (neale-custom-lisp-mode)
  (sw1nn-add-clj-compile-on-save)
  (hs-minor-mode)
  (define-key clojure-mode-map (kbd "RET") 'electrify-return-if-match)
  (define-key clojure-mode-map (kbd "M-[") 'paredit-wrap-square)
  (define-key clojure-mode-map (kbd "M-{") 'paredit-wrap-curly)
  (define-key clojure-mode-map (kbd "M-t") 'sw1nn-transpose-words-with-hyphens)
  (set (make-local-variable 'font-lock-extra-managed-props) '(composition)) ; revert fancy characters.
  (set (make-local-variable 'scroll-margin) 3))

(defun neale-custom-cider-mode ()
  (neale-custom-lisp-mode))

(defun neale-custom-inferior-lisp-mode ()
  (neale-custom-lisp-mode))

(add-hook 'cider-repl-mode-hook 'neale-custom-cider-mode)
(add-hook 'lisp-mode-hook 'neale-custom-lisp-mode)
(add-hook 'emacs-lisp-mode-hook 'neale-custom-lisp-mode)
(add-hook 'clojure-mode-hook 'neale-custom-clojure-mode)
(add-hook 'inferior-lisp-mode-hook 'neale-custom-inferior-lisp-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(put-clojure-indent 'go-loop 'defun)
