(use-package which-key
  :ensure t
  :init (which-key-setup-side-window-bottom)
  :config (which-key-mode)
  :diminish which-key-mode)

(global-set-key [remap list-buffers] #'ibuffer-list-buffers)

(global-set-key (kbd "C-c t") #'eshell)
(global-set-key (kbd "C-c v") #'revert-buffer)
(global-set-key (kbd "C-c b b") #'browse-url)
(global-set-key (kbd "C-c b e") #'browse-url-emacs)
(global-set-key (kbd "C-c b j") #'sw1nn/browse-url-emacs-as-json)
(global-set-key (kbd "C-c b c") #'sw1nn/browse-url-emacs-as-csv)

;; do we ever want list-directory instead of dired? don't think so.
(global-set-key [remap list-directory] #'dired)

(global-set-key (kbd "C-+") #'text-scale-increase)
(global-set-key (kbd "C--") #'text-scale-decrease)
(global-set-key (kbd "C-0") #'text-scale-reset)

;; mimics the chromeOS C-S-u unicode shortcut
(global-set-key [remap insert-char] #'counsel-unicode-char)
(global-set-key (kbd "C-S-u") #'counsel-unicode-char)

;; remove suspend-frame bindings, I never want to do this.
(global-set-key [remap suspend-frame] 'ignore)

(unbind-key "C-x C-c") ;; too easy to fat finger

(unbind-key "<insert>")
(define-key global-map [(control insert)] 'overwrite-mode)
