(require 'expand-region)

(require 'linum-off)

(require 'volatile-highlights)

;(require 'powerline)

(require 'uniquify)

(require 'saveplace)

(require 'fold-dwim)
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

(add-to-list 'default-frame-alist '(height . 55))
(add-to-list 'default-frame-alist '(width . 188))

(setq inhibit-splash-screen t)

(setq custom-theme-directory (concat user-emacs-directory "themes"))

(ido-mode t)
(ido-ubiquitous t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point nil
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

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

(volatile-highlights-mode t)
(winner-mode t)
(setq winner-boring-buffers '("*Completions*"
                              "*Help*"
                              "*Kill Ring*"
                              "*magit-edit-log*"
                              "*Backtrace*"
                              "*Compile-Log*"
                              "*Packages*"
                              "*Apropos*"))
(defalias 'yes-or-no-p 'y-or-n-p)

(setq smex-save-file (concat user-emacs-directory ".smex-items"))

(smex-initialize)

(windmove-default-keybindings) ;; Shift+direction

(global-undo-tree-mode t)
;; die tabs, DIE!
(setq indent-tabs-mode nil)

(setq-default cursor-type 'bar)

(add-hook 'before-save-hook (lambda () (untabify (point-min) (point-max))))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(global-hl-line-mode t)

;(powerline-default-theme)

;; allow sw1nn and sw1nn-whiteboard themes.
(add-to-list 'custom-safe-themes "f87193727466d522c48e4b665b8df10de18c2923b3f7747e86437fae4680197a")
(add-to-list 'custom-safe-themes "af4ed275cddf70e5f53cec12ddecdeeb4ced75796e910aee779725ab211aba89")

(setq scroll-margin 3
      scroll-conservatively 1000 ; > 100 => never recentre point
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)

(setq dired-use-ls-dired nil)

(load-theme 'sw1nn t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
