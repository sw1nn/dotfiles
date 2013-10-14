(require 'multi-term)

(setq multi-term-program "/bin/zsh"
      multi-term-program-switches "-l"
      shell-prompt-pattern "❯❯❯ "
      default-process-coding-system '(utf-8-unix . utf-8-unix)
      system-uses-terminfo nil)

(defun term-send-tab ()
  "Send tab in term mode."
  (interactive)
  (term-send-raw-string "\t"))

(add-to-list 'term-bind-key-alist '("<tab>" . term-send-tab))
(add-to-list 'term-bind-key-alist '("C-c C-k" . term-line-mode))
