(require 'json-mode)

(add-hook 'json-mode-hook
          (lambda ()
                  (hs-minor-mode)
                  (define-key js-mode-map (kbd "C-x f") 'fold-dwim-toggle)))
