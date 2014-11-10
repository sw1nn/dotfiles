;; (defun sw1nn-python-hook nil
;;   (fci-mode))

;; (add-hook 'python-mode-hook 'sw1nn-python-hook)

;; (elpy-enable)
;; (elpy-use-ipython)

(push "~/.virtualenvs/pymacs/bin" exec-path)
(setenv "PATH"
        (concat
         "~/.virtualenvs/pymacs/bin" ":"
         (getenv "PATH")))
