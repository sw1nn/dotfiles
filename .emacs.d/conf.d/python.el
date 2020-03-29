;; (defun sw1nn/python-hook nil
;;   (fci-mode))

;; (add-hook 'python-mode-hook 'sw1nn/python-hook)

;; (elpy-enable)
;; (elpy-use-ipython)

;; pip2 install rope
;; pip2 install flake8

(defun sw1nn/python-hook nil
  (add-to-list 'company-backends 'company-jedi))

(use-package pyenv-mode)

(use-package elpy
  :hook (python-mode . smartparens-mode)
  :config
  (setq elpy-rpc-backend "jedi")
  :init
  (advice-add 'python-mode :before 'elpy-enable))
