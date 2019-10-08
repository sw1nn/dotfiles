;; (defun sw1nn/python-hook nil
;;   (fci-mode))

;; (add-hook 'python-mode-hook 'sw1nn/python-hook)

;; (elpy-enable)
;; (elpy-use-ipython)

;; pip2 install rope
;; pip2 install flake8

(defun sw1nn/python-hook nil
  (add-to-list 'company-backends 'company-jedi))

(use-package pyenv-mode
  :ensure t
  :defer t)

(use-package elpy
  :ensure t
  :defer t
  :config
  (setq elpy-rpc-backend "jedi")
  (add-hook 'python-mode-hook #'smartparens-mode)
  :init
  (advice-add 'python-mode :before 'elpy-enable))
