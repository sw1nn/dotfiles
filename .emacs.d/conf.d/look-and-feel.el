;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; look and feel tweaks
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode)) (when (fboundp mode) (funcall mode -1)))

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))

(setq inhibit-splash-screen t)

(add-to-list 'default-frame-alist '(height . 55))
(add-to-list 'default-frame-alist '(width . 212))

(load-theme 'sanityinc-solarized-dark t)

(set-face-attribute 'eldoc-highlight-function-argument nil :foreground "#859900")

(set-face-attribute 'nrepl-error-highlight-face nil :inherit nil :underline '(:color "red4" :style wave))
(set-face-attribute 'nrepl-warning-highlight-face nil :inherit nil :underline '(:color "red" :style wave))

(set-face-attribute 'flyspell-duplicate nil :inherit nil :underline '(:color "gold4" :style wave))
(set-face-attribute 'flyspell-incorrect nil :inherit nil :underline '(:color "red4" :style wave))

(set-face-attribute 'git-gutter-fr:modified nil :foreground "#d33682")

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



(setq git-gutter-fr:side 'left-fringe)

(global-git-gutter-mode t)


(setq global-undo-tree-mode t)


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
