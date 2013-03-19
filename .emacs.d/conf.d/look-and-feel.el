(require 'expand-region)

(require 'linum-off)

(require 'volatile-highlights)

(require 'powerline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; look and feel tweaks
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode)) (when (fboundp mode) (funcall mode -1)))

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))

(add-to-list 'default-frame-alist '(height . 55))
(add-to-list 'default-frame-alist '(width . 212))

(setq inhibit-splash-screen t)

(setq custom-theme-directory (concat user-emacs-directory "themes"))
(load-theme 'sw1nn t)

(ido-mode t)
(ido-ubiquitous t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

(setq global-linum-mode t
      linum-disabled-modes-list '(eshell-mode 
				  wl-summary-mode 
				  compilation-mode 
				  org-mode 
				  text-mode 
				  dired-mode 
				  erc-mode)
      linum-format "%03d")

; '(recenter-positions (quote (0.2 0.4 0.6 0.8 bottom top)))
(setq same-window-regexps (quote '(("\\*magit: [[:ascii:]]\\*")))
      visible-bell nil
      volatile-highlights-mode t)

(winner-mode t)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq smex-save-file (concat user-emacs-directory ".smex-items"))

(smex-initialize)

(windmove-default-keybindings) ;; Shift+direction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
