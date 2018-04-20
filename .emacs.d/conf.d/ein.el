
(use-package ein
  :pin melpa
  :ensure t
  :init
  (add-hook 'ein:connect-mode-hook 'ein:jedi-setup)
  (add-to-list 'company-backends 'ein:company-backend))
