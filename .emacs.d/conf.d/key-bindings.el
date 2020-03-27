(use-package which-key
  :ensure t
  :init (which-key-setup-side-window-bottom)
  :config (which-key-mode)
  :diminish which-key-mode)

(global-set-key (kbd "C-r") #'swiper-isearch-backward)
(global-set-key (kbd "C-s") #'swiper-isearch)

(global-set-key (kbd "M-%") #'query-replace-regexp)
(global-set-key (kbd "M-0") #'forward-sexp)
(global-set-key (kbd "M-1") #'delete-other-windows)
(global-set-key (kbd "M-9") #'backward-sexp)
(global-set-key (kbd "M-y") #'browse-kill-ring)

;; (global-set-key (kbd "C-c m")   #'sw1nn/mc-map)
(global-set-key (kbd "C-c t")   #'sw1nn/ansi-term)
(global-set-key (kbd "C-c v")   #'revert-buffer)

(global-set-key (kbd "C-x C-b") #'ibuffer)

(global-set-key (kbd "C-+") #'text-scale-increase)
(global-set-key (kbd "C--") #'text-scale-decrease)
(global-set-key (kbd "C-0") #'text-scale-reset)

;; remove suspend-frame bindings, too annoying.
(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "C-x C-z") nil)

(unbind-key "C-x C-c")
(unbind-key "<insert>")
(define-key global-map [(control insert)] 'overwrite-mode)
