;; (defun sw1nn-python-hook nil
;;   (fci-mode))

;; (add-hook 'python-mode-hook 'sw1nn-python-hook)

;; (elpy-enable)
;; (elpy-use-ipython)

;; pip2 install rope
;; pip2 install flake8


(use-package elpy
  :ensure t
  :init
  (elpy-enable))
