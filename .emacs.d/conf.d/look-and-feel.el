;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; look and feel tweaks
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq frame-title-format "%b")
(setq inhibit-splash-screen t)

(add-to-list 'default-frame-alist '(height . 55))
(add-to-list 'default-frame-alist '(width . 212))

(load-theme 'sanityinc-solarized-dark t)

(ido-mode t)
(ido-ubiquitous-mode t)

(fset 'yes-or-no-p 'y-or-n-p)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
