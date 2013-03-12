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

(defalias 'yes-or-no-p 'y-or-n-p)

(setq smex-save-file (concat user-emacs-directory ".smex-items"))

(smex-initialize)

(windmove-default-keybindings) ;; Shift+direction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
