;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Key binding tweaks
; See
; http://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs

(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(define-key my-keys-minor-mode-map (kbd "C-\\") (lambda nil (interactive))) ; remove annoying input-method binding.
(define-key my-keys-minor-mode-map (kbd "C-x C-z") (lambda nil (interactive)))
(define-key my-keys-minor-mode-map (kbd "C-z") (lambda nil (interactive)))
(define-key my-keys-minor-mode-map (kbd "s-p") (lambda nil (interactive)))
(define-key my-keys-minor-mode-map (kbd "M-TAB") 'yas/expand)
(define-key my-keys-minor-mode-map (kbd "<select>") 'windmove-up)
(define-key my-keys-minor-mode-map (kbd "C-x C-b") 'ibuffer)
(define-key my-keys-minor-mode-map (kbd "C-M-z") 'align-cljlet)
(define-key my-keys-minor-mode-map (kbd "C-=") 'er/expand-region)
(define-key my-keys-minor-mode-map (kbd "C-S-c C-S-c") 'mc/edit-lines)
(define-key my-keys-minor-mode-map (kbd "C->") 'mc/mark-next-like-this)
(define-key my-keys-minor-mode-map (kbd "C-<") 'mc/mark-previous-like-this)
(define-key my-keys-minor-mode-map (kbd "C-c C-<") 'mc/mark-all-like-this-dwim)
(define-key my-keys-minor-mode-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key my-keys-minor-mode-map (kbd "C-c M-SPC") 'ace-jump-mode-pop-mark)
(define-key my-keys-minor-mode-map (kbd "C-x C-SPC") (lambda nil (interactive) (just-one-space -1) (fixup-whitespace)))
(define-key my-keys-minor-mode-map (kbd "C-M-g") 'magit-status)
(define-key my-keys-minor-mode-map (kbd "C-c g p") 'git-gutter+-previous-hunk)
(define-key my-keys-minor-mode-map (kbd "C-c g n") 'git-gutter+-next-hunk)
(define-key my-keys-minor-mode-map (kbd "C-c g d") 'git-gutter+-popup-hunk)
(define-key my-keys-minor-mode-map (kbd "C-c g v") 'git-gutter+-revert-hunks)
(define-key my-keys-minor-mode-map (kbd "C-c g s") 'git-gutter+-stage-hunks)
(define-key my-keys-minor-mode-map (kbd "C-c g s") 'git-gutter+-)
(define-key my-keys-minor-mode-map (kbd "M-x") 'smex)
(define-key my-keys-minor-mode-map (kbd "C-x O") (lambda nil (interactive) (other-window -1))) ;; back one
(define-key my-keys-minor-mode-map (kbd "C-x C-o") (lambda nil (interactive) (other-window 2))) ;; forward two

;; If you want to be able to M-x without meta (phones, etc)
(define-key my-keys-minor-mode-map (kbd "C-c x") 'execute-extended-command)

;; Use regex searches by default.
(define-key my-keys-minor-mode-map (kbd "C-s") 'isearch-forward-regexp)
(define-key my-keys-minor-mode-map (kbd "C-r") 'isearch-backward-regexp)
(define-key my-keys-minor-mode-map (kbd "M-%") 'query-replace-regexp)
(define-key my-keys-minor-mode-map (kbd "C-M-s") 'isearch-forward)
(define-key my-keys-minor-mode-map (kbd "C-M-r") 'isearch-backward)
(define-key my-keys-minor-mode-map (kbd "C-M-%") 'query-replace)

;; Jump to a definition in the current file. (Protip: this is awesome.)
(define-key my-keys-minor-mode-map (kbd "C-x C-i") 'imenu)

;; File finding
(define-key my-keys-minor-mode-map (kbd "C-x C-f") 'ido-find-file) ; needed to override ibuffer-find-file
(define-key my-keys-minor-mode-map (kbd "C-x M-f") 'ido-find-file-other-window)
(define-key my-keys-minor-mode-map (kbd "C-x p") 'magit-find-file-completing-read)
(define-key my-keys-minor-mode-map (kbd "C-c y") 'bury-buffer)

(define-key my-keys-minor-mode-map (kbd "C-c v") 'revert-buffer)

(define-key my-keys-minor-mode-map (kbd "C-x C-m") 'multi-term)

(define-key my-keys-minor-mode-map (kbd "C-+") 'text-scale-increase)
(define-key my-keys-minor-mode-map (kbd "C--") 'text-scale-decrease)

(define-key my-keys-minor-mode-map (kbd "M-y") 'browse-kill-ring)
(define-key my-keys-minor-mode-map (kbd "M-/") 'hippie-expand)
(define-key my-keys-minor-mode-map (kbd "C-c M-i") 'idle-highlight-mode)

(define-key my-keys-minor-mode-map (kbd "<f9>") 'sw1nn-toggle-clj-compile-on-save)
(define-key my-keys-minor-mode-map (kbd "<f10>") 'sw1nn-toggle-cider-repl-popup-stacktraces)
(define-key my-keys-minor-mode-map (kbd "<f11>") 'sw1nn-toggle-fullscreen)
(define-key my-keys-minor-mode-map (kbd "<f12>") 'sw1nn-cider-perspective)
(define-key my-keys-minor-mode-map (kbd "C-c r") 'sw1nn-cider-reset)

(define-key my-keys-minor-mode-map (kbd "C-c a") 'org-agenda)
(define-key my-keys-minor-mode-map (kbd "C-c f") 'fold-dwim-toggle)
(when (eq system-type 'darwin)
  (load-file (concat user-emacs-directory "conf.d/google-music-key-bodge.el")))

(if (fboundp 'music-prev-song)
    (define-key my-keys-minor-mode-map (kbd "<f7>") 'music-prev-song))
(if (fboundp 'music-play-pause)
    (define-key my-keys-minor-mode-map (kbd "<f8>") 'music-play-pause))
(if (fboundp 'music-prev-song)
    (define-key my-keys-minor-mode-map (kbd "<f9>") 'music-next-song))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

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
