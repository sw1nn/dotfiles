(require 'multi-term)

(setq multi-term-program "/bin/zsh"
      shell-prompt-pattern "% "
      default-process-coding-system '(utf-8-unix . utf-8-unix)
      system-uses-terminfo nil)

;; (setq system-uses-terminfo nil) often doesn't work. not sure why,
;; so try a variant of this command at the shell.
;;
;; $ tic -o ~/.terminfo /Applications/Emacs.app/Contents/Resources/etc/e/eterm-color.ti

(defun term-send-tab ()
  "Send tab in term mode."
  (interactive)
  (term-send-raw-string "\t"))

(add-to-list 'term-bind-key-alist '("<tab>" . term-send-tab))
(add-to-list 'term-bind-key-alist '("C-c C-k" . term-line-mode))
