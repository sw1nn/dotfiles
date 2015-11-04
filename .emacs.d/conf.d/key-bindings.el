(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "M-%") 'query-replace-regexp)
(global-set-key (kbd "M-0") 'forward-sexp)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") #'er/expand-region)
(global-set-key (kbd "M-3") #'mc/mark-next-like-this)
(global-set-key (kbd "M-4") #'mc/mark-previous-like-this)
(global-set-key (kbd "M-9") 'backward-sexp)

(global-set-key (kbd "C-c f") 'fold-dwim-toggle)
(global-set-key (kbd "C-c s") 'sw1nn-ag-search)

(define-key ctl-x-map (kbd "C-b") 'ibuffer)
(define-key ctl-x-map "g" 'magit-status)
(define-key ctl-x-map "p" 'magit-find-file-completing-read)

(define-key ctl-x-map "\C-m" #'mc/mark-all-dwim)

(define-prefix-command 'sw1nn/mc-map)

(define-key ctl-x-map "m" 'sw1nn/mc-map)

;;; Really really nice!
(define-key sw1nn/mc-map "i" #'mc/insert-numbers)
(define-key sw1nn/mc-map "h" #'mc-hide-unmatched-lines-mode)
(define-key sw1nn/mc-map "a" #'mc/mark-all-like-this)

;;; Occasionally useful
(define-key sw1nn/mc-map "d"
  #'mc/mark-all-symbols-like-this-in-defun)
(define-key sw1nn/mc-map "r" #'mc/reverse-regions)
(define-key sw1nn/mc-map "s" #'mc/sort-regions)
(define-key sw1nn/mc-map "l" #'mc/edit-lines)
(define-key sw1nn/mc-map "\C-a"
  #'mc/edit-beginnings-of-lines)
(define-key sw1nn/mc-map "\C-e"
    #'mc/edit-ends-of-lines)
