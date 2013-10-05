(require 'multi-term)

(setq multi-term-program "/bin/zsh"
      shell-prompt-pattern "^λ ")

(defun term-send-tab ()
  "Send tab in term mode."
  (interactive)
  (term-send-raw-string "\t"))

(add-to-list 'term-bind-key-alist '("<tab>" . term-send-tab))
(add-to-list 'term-bind-key-alist '("C-c C-k" . term-line-mode))
