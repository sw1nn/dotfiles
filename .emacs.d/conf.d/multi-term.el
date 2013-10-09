(require 'multi-term)

(setq multi-term-program "/bin/zsh"
      multi-term-program-switches "-l"
      shell-prompt-pattern "❯❯❯ ")

(defun term-send-tab ()
  "Send tab in term mode."
  (interactive)
  (term-send-raw-string "\t"))

(add-to-list 'term-bind-key-alist '("<tab>" . term-send-tab))
(add-to-list 'term-bind-key-alist '("C-c C-k" . term-line-mode))
