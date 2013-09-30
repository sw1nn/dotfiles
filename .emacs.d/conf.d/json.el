(require 'json-mode)

(add-hook 'json-mode-hook
          (lambda nil
                  (hs-minor-mode)
                  (define-key js-mode-map (kbd "C-x f") 'fold-dwim-toggle)))
