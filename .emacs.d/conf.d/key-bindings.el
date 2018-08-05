(use-package guide-key
  :ensure t
  :init    (setq guide-key/guide-key-sequence
                 '("C-x r"     ; rectanges and registers
                   "C-x 4"     ; window commands
                   "C-x w"     ; alternative to M-s ...
                   "C-c @"     ; hs-hide-show mode
                   "C-c m"     ; multiple cursors
                   "C-c C-v"   ; cider
                   "C-c C-t"   ; verilog mode
                   "C-c C-a"   ; artist mode
                   org-mode "C-c C-x"))
  :config  (guide-key-mode t)
  :diminish guide-key-mode)

(global-set-key (kbd "C-r") #'isearch-backward-regexp)
(global-set-key (kbd "C-s") #'isearch-forward-regexp)

(global-set-key (kbd "M-%") #'query-replace-regexp)
(global-set-key (kbd "M-0") #'forward-sexp)
(global-set-key (kbd "M-1") #'delete-other-windows)
(global-set-key (kbd "M-2") #'er/expand-region)
(global-set-key (kbd "M-3") #'mc/mark-next-like-this)
(global-set-key (kbd "M-4") #'mc/mark-previous-like-this)
(global-set-key (kbd "M-9") #'backward-sexp)
(global-set-key (kbd "M-y") #'browse-kill-ring)

(global-set-key (kbd "C-c M-f")   #'fold-dwim-toggle)
(global-set-key (kbd "C-c m")   #'sw1nn/mc-map)
(global-set-key (kbd "C-c t")   #'sw1nn/ansi-term)
(global-set-key (kbd "C-c v")   #'revert-buffer)
(global-set-key (kbd "C-c SPC") #'ace-jump-mode)

(global-set-key (kbd "C-x C-b") #'ibuffer)
(global-set-key (kbd "C-x C-m") #'mc/mark-all-dwim)

;; remove suspend-frame bindings, too annoying.
(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "C-x C-z") nil)

(define-prefix-command 'sw1nn/mc-map)
(define-key sw1nn/mc-map "i"    #'mc/insert-numbers)
(define-key sw1nn/mc-map "h"    #'mc-hide-unmatched-lines-mode)
(define-key sw1nn/mc-map "a"    #'mc/mark-all-like-this)
(define-key sw1nn/mc-map "d"    #'mc/mark-all-symbols-like-this-in-defun)
(define-key sw1nn/mc-map "r"    #'mc/reverse-regions)
(define-key sw1nn/mc-map "s"    #'mc/sort-regions)
(define-key sw1nn/mc-map "l"    #'mc/edit-lines)
(define-key sw1nn/mc-map "\C-a" #'mc/edit-beginnings-of-lines)
(define-key sw1nn/mc-map "\C-e" #'mc/edit-ends-of-lines)

(unbind-key "C-x C-c")
