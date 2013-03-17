;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Key binding tweaks
; See
; http://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs

(global-unset-key (kbd "s-p"))

(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(define-key my-keys-minor-mode-map (kbd "C-\\") nil) ; remove annoying input-method binding.

(define-key my-keys-minor-mode-map (kbd "M-TAB") 'yas/expand)
(define-key my-keys-minor-mode-map (kbd "<select>") 'windmove-up)
(define-key my-keys-minor-mode-map (kbd "C-x C-b") 'ibuffer)
(define-key my-keys-minor-mode-map (kbd "C-M-z") 'align-cljlet)
(define-key my-keys-minor-mode-map (kbd "C-=") 'er/expand-region)
(define-key my-keys-minor-mode-map (kbd "C-S-c C-S-c") 'mc/edit-lines)
(define-key my-keys-minor-mode-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key my-keys-minor-mode-map (kbd "C-c C-SPC") 'ace-jump-mode-pop-mark)
(define-key my-keys-minor-mode-map (kbd "M-SPC") (lambda () (interactive) (just-one-space -1)))
(define-key my-keys-minor-mode-map (kbd "C-M-g") 'magit-status)
(define-key my-keys-minor-mode-map (kbd "C-c g g") 'git-gutter:toggle)
(define-key my-keys-minor-mode-map (kbd "C-c g p") 'git-gutter:previous-diff)
(define-key my-keys-minor-mode-map (kbd "C-c g n") 'git-gutter:next-diff)
(define-key my-keys-minor-mode-map (kbd "C-c g d") 'git-gutter:popup-diff)
(define-key my-keys-minor-mode-map (kbd "C-c g v") 'git-gutter:revert-hunk)
(define-key my-keys-minor-mode-map (kbd "M-x") 'smex)
(define-key my-keys-minor-mode-map (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one
(define-key my-keys-minor-mode-map (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward two

;; If you want to be able to M-x without meta (phones, etc)
(define-key my-keys-minor-mode-map (kbd "C-c x") 'execute-extended-command)

;; Use regex searches by default.
(define-key my-keys-minor-mode-map (kbd "C-s") 'isearch-forward-regexp)
(define-key my-keys-minor-mode-map (kbd "\C-r") 'isearch-backward-regexp)
(define-key my-keys-minor-mode-map (kbd "M-%") 'query-replace-regexp)
(define-key my-keys-minor-mode-map (kbd "C-M-s") 'isearch-forward)
(define-key my-keys-minor-mode-map (kbd "C-M-r") 'isearch-backward)
(define-key my-keys-minor-mode-map (kbd "C-M-%") 'query-replace)

;; Jump to a definition in the current file. (Protip: this is awesome.)
(define-key my-keys-minor-mode-map (kbd "C-x C-i") 'imenu)

;; File finding
(define-key my-keys-minor-mode-map (kbd "C-x M-f") 'ido-find-file-other-window)
(define-key my-keys-minor-mode-map (kbd "C-c y") 'bury-buffer)
(define-key my-keys-minor-mode-map (kbd "C-c v") 'revert-buffer)

(define-key my-keys-minor-mode-map (kbd "C-x C-m") 'shell)

(define-key my-keys-minor-mode-map (kbd "C-+") 'text-scale-increase)
(define-key my-keys-minor-mode-map (kbd "C--") 'text-scale-decrease)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " ߐ" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)

(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

(defadvice load (after give-my-keybindings-priority)
  "Try to ensure that my keybindings always have priority."
  (if (not (eq (car (car minor-mode-map-alist)) 'my-keys-minor-mode))
      (let ((mykeys (assq 'my-keys-minor-mode minor-mode-map-alist)))
        (assq-delete-all 'my-keys-minor-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))
(ad-activate 'load)