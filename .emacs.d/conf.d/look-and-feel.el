(use-package expand-region
  :ensure t)

(use-package volatile-highlights
  :ensure t)

(use-package powerline
  :ensure t)

(use-package saveplace
  :ensure t)

(use-package fold-dwim
  :ensure t)

(use-package win-switch
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package ido
  :ensure t
  :init
  (ido-mode t)
  :config
  (setq
   ido-enable-prefix nil
   ido-enable-flex-matching t
   ido-auto-merge-work-directories-length nil
   ido-create-new-buffer 'always
   ido-use-filename-at-point nil
   ido-use-virtual-buffers t
   ido-handle-duplicate-virtual-buffers 2
   ido-max-prospects 10))

(use-package ido-ubiquitous
  :ensure t
  :init
  (ido-ubiquitous-mode t))

(use-package browse-kill-ring
  :ensure t)

(use-package hideshowvis
  :ensure t
  :diminish hs-minor-mode
  :init
  (hideshowvis-enable)
  (hideshowvis-symbols))

(use-package ace-jump-mode
  :commands ace-jump-mode
  :ensure t
  :init
   (bind-key "C-." 'ace-jump-mode))

(use-package uniquify)

(use-package visual-line-mode
  :diminish visual-line-mode)


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


(setq-default save-place t
              uniquify-buffer-name-style 'forward
              x-select-enable-clipboard t
              x-select-enable-primary t
              save-interprogram-paste-before-kill t
              apropos-do-all t
              mouse-yank-at-point t
              save-place-file (concat user-emacs-directory "places"))

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
            ;;(when (sw1nn-untabify-p)
            ;;    (untabify (point-min) (point-max)))

            (delete-trailing-whitespace)))

;(powerline-default-theme)

;; allow sw1nn and sw1nn-whiteboard themes.

(add-to-list 'custom-safe-themes "b2048c55ef23de285bf8154ed030a1b1b291ac15917cccd438e05b138b8f4e19") ; sw1nn
(add-to-list 'custom-safe-themes "af4ed275cddf70e5f53cec12ddecdeeb4ced75796e910aee779725ab211aba89") ; sw1nn-whiteboard

;; this lets us have a .dir-locals.el turning on rainbow-mode for themes.
(add-to-list 'safe-local-variable-values '(eval rainbow-mode t))

(setq scroll-conservatively 1000 ; > 100 => never recentre point
      scroll-up-aggressively 0.1
      scroll-down-aggressively 0.1)

(setq dired-use-ls-dired nil)

(setq kill-do-not-save-duplicates t)

(setq recentf-save-file (concat user-emacs-directory ".recentf"))

;; make files opened in .jar etc read-only by default.
(add-hook 'archive-extract-hook
          (lambda nil
            (read-only-mode)))

(setq win-switch-window-threshold 1
      win-switch-idle-time 0.7
      win-switch-feedback-background-color "#008800"
      win-switch-feedback-foreground-color "#00ff00")

(win-switch-setup-keys-ijkl "\C-xo" "\C-x\C-o")

(auto-compression-mode t)
(global-hl-line-mode t)

(load-theme 'sw1nn t)

(put 'narrow-to-region 'disabled nil)

(windmove-default-keybindings)
(powerline-default-theme)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
