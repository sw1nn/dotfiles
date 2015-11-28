(use-package smex
  :ensure t)

(use-package expand-region
  :ensure t)

(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode t))

(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/theme 'respectful)
  (setq rm-whitelist (quote (" Paredit")))
  (sml/setup)
  (add-to-list 'sml/replacer-regexp-list '("^~/workspace/" ":WS:") t)
  (add-to-list 'sml/replacer-regexp-list '("^:WS:\\([^/]+\\)" ":WS[\\1]:") t)
  (add-to-list 'sml/replacer-regexp-list '("^:WS:dotfiles/.emacs.d/" ":ED:") t))

(use-package saveplace
  :ensure t
  :config
  (setq save-place t
        save-place-file (concat user-emacs-directory "places")))

(defface sw1nn-hs-fold-overlay-face
  '((t (:background "#fdf6e3" :foreground "#232323")))
  "Face for fold overlay"
  :group 'sw1nn-faces)

(use-package fold-dwim
  :ensure t
  :config
  (setq hs-set-up-overlay
        (defun sw1nn/display-code-line-counts (ov)
          (when (eq 'code (overlay-get ov 'hs))
            (overlay-put ov 'display
                         (propertize
                          (format " ⤵ <%03d>"
                                  (count-lines (overlay-start ov)
                                               (overlay-end ov)))
                          'face 'sw1nn-hs-fold-overlay-face))))))

(use-package win-switch
  :ensure t
  :config
  (setq win-switch-window-threshold 1
      win-switch-idle-time 0.7
      win-switch-feedback-background-color "#008800"
      win-switch-feedback-foreground-color "#00ff00"))

(use-package dockerfile-mode
  :ensure t)

(use-package ido
  :ensure t
  :config
  (ido-mode)
  (ido-everywhere)
  (setq ido-auto-merge-work-directories-length -1
        ido-cannot-complete-command 'ignore
        ido-save-directory-list-file "~/.emacs.d/var/cache/ido.last"
        ido-use-virtual-buffers t))

(use-package ido-ubiquitous
  :ensure t
  :config (ido-ubiquitous-mode))

(use-package ido-vertical-mode
  :ensure t
  :config (ido-vertical-mode))

(use-package flx-ido
  :pin melpa-stable
  :ensure t
  :config
  (flx-ido-mode)
  (setq ido-enable-flex-matching t))

(use-package browse-kill-ring
  :ensure t)

(use-package ace-jump-mode
  :ensure t)

(use-package uniquify)

(use-package idle-highlight-mode
  :ensure t)

(use-package rainbow-mode
  :ensure t)

(use-package hs-minor-mode
  :diminish hs-minor-mode)

(use-package color-identifiers-mode
  :ensure t
  :diminish color-identifiers-mode)

(use-package beacon
  :ensure t
  :init (beacon-mode 1)
  :config
  (progn
    (setq beacon-color "#cccec4")
    ;; Don't blink on specific major modes
    (add-to-list 'beacon-dont-blink-major-modes 'cider-repl-mode)
    (add-to-list 'beacon-dont-blink-major-modes 'term-mode)
    (add-to-list 'beacon-dont-blink-major-modes 'shell-mode)
    (add-to-list 'beacon-dont-blink-major-modes 'eshell-mode)
    ;; Don't blink on next-line/previous-line at the top/bottom of the window
    (add-to-list 'beacon-dont-blink-commands 'next-line)
    (add-to-list 'beacon-dont-blink-commands 'previous-line))
  :diminish beacon-mode)

;;(use-package ws-butler
;;  :ensure t
;;  :config (ws-butler-global-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; look and feel tweaks
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode)
    (funcall mode -1)))

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))

(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 160))

(setq inhibit-splash-screen t)
(setq make-backup-files nil)

(setq custom-theme-directory (concat user-emacs-directory "themes"))

(setq-default uniquify-buffer-name-style 'forward
              x-select-enable-clipboard t
              x-select-enable-primary t
              save-interprogram-paste-before-kill t
              apropos-do-all t
              mouse-yank-at-point t)

;; Save all tempfiles in $TMPDIR/emacs$UID/                                                        
(defconst emacs-tmp-dir (format "%s/%s%s" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist `((".*" . ,emacs-tmp-dir))
      auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t))
      auto-save-list-file-prefix emacs-tmp-dir)

(savehist-mode t)

(global-auto-revert-mode t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; turn on linum mode globally except for certain modes.
(setq global-linum-mode t
      linum-disabled-modes-list '(eshell-mode
                                  wl-summary-mode
                                  compilation-mode
                                  org-mode
                                  text-mode
                                  dired-mode
                                  erc-mode)
      linum-format "%03d")

(setq same-window-regexps (quote '(("\\*magit: [[:ascii:]]\\*")))
      visible-bell nil)

(winner-mode t)
(setq winner-boring-buffers '("*Completions*"
                              "*Help*"
                              "*Kill Ring*"
                              "*magit-edit-log*"
                              "*Backtrace*"
                              "*Compile-Log*"
                              "*Packages*"
                              "*Apropos*"
                              "*cider-error*"
                              "*cider-doc*"
                              "*cider-src*"
                              "*cider-result*"
                              "*cider-macroexpansion*"
                              "*magit-commit*"
                              "*magit-diff*"
                              "*magit-edit-log*"))

(defalias 'yes-or-no-p 'y-or-n-p)

;; die tabs, DIE!
(setq indent-tabs-mode nil)

(setq-default cursor-type 'bar)

(add-hook 'before-save-hook
          (lambda nil
            (when (sw1nn-untabify-p)
              (untabify (point-min) (point-max))
              (delete-trailing-whitespace))
            (when (bound-and-true-p paredit-mode)
              (check-parens))))

;; allow sw1nn and sw1nn-whiteboard themes.

(add-to-list 'custom-safe-themes "b2048c55ef23de285bf8154ed030a1b1b291ac15917cccd438e05b138b8f4e19") ; sw1nn
(add-to-list 'custom-safe-themes "af4ed275cddf70e5f53cec12ddecdeeb4ced75796e910aee779725ab211aba89") ; sw1nn-whiteboard

;; this lets us have a .dir-locals.el turning on rainbow-mode for themes.
(add-to-list 'safe-local-variable-values '(eval rainbow-mode t))

(setq scroll-margin 5
      scroll-conservatively 1000               ; > 100 => never recentre point
      scroll-up-aggressively 0.1
      scroll-down-aggressively 0.1)

(setq dired-use-ls-dired nil)

(setq kill-do-not-save-duplicates t)

(setq recentf-save-file (concat user-emacs-directory ".recentf"))

;; make files opened in .jar etc read-only by default.
(add-hook 'archive-extract-hook
          (lambda nil
            (read-only-mode)))

(setq browse-url-browser-function 'browse-url-xdg-open)

(win-switch-setup-keys-ijkl "\C-xo" "\C-x\C-o")

(auto-compression-mode t)
(global-hl-line-mode t)

(load-theme 'sw1nn t)

(put 'narrow-to-region 'disabled nil)

(windmove-default-keybindings)
;; (powerline-default-theme)
