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

(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
			 (require 'lsp-python-ms)
			 (lsp))))  ; or lsp-deferred

;; (use-package elpy
;;   :hook (python-mode . smartparens-mode)
;;   :init
;;   :config
;;   (defun sw1nn/direnv-current-python-virtualenv ()
;;     (getenv "VIRTUAL_ENV"))
;;   (setq elpy-rpc-backend "jedi")
;;   :init
;;   (setq elpy-rpc-virtualenv-path #'sw1nn/direnv-current-python-virtualenv)
;;   (advice-add 'python-mode :before 'elpy-enable))
