(defvar mode-line-symbols
  '((auto-complete-mode . "℀")
    (clojure-mode . "λ")
    (emacs-lisp-mode . "ℰ")
    (flyspell-mode . "✓")
    (cider-mode . "𝕔")
    (cider-repl-mode . "ℂ")
    (clojure-test-mode . "λt")
    (hs-minor-mode . "𝓈")
    (my-keys-minor-mode . "⌨")
    (paredit-mode . "☾☽")
    (git-gutter+-mode . "⇌")
    (eldoc-mode . "ℯ")
    (yas-minor-mode . "✂")
    (undo-tree-mode . "↶")
    (volatile-highlights-mode . "ℏ")))

(defun clean-mode-line ()
  (interactive)
  (loop for cleaner in mode-line-symbols
        do (let* ((mode (car cleaner))
                  (mode-str (cdr cleaner))
                  (old-mode-str (cdr (assq mode minor-mode-alist))))
             (when old-mode-str
               (setcar old-mode-str mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)
(add-hook 'after-change-minor-mode-hook 'clean-mode-line)
