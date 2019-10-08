(use-package smex
  :ensure t
  :bind ("M-x" . smex))

(use-package expand-region
  :ensure t)

(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode t))

(defvar electrify-return-match
  "[\]}\)\"]"
  "If this regexp matches the text after the cursor, do an \"electric\"
  return.")

(defun electrify-return-if-match (arg)
  "If the text after the cursor matches `electrify-return-match' then
  open and indent an empty line between the cursor and the text.  Move the
  cursor to the new line."
  (interactive "P")
  (let ((case-fold-search nil))
    (if (looking-at electrify-return-match)
        (save-excursion (newline-and-indent)))
    (newline arg)
    (indent-according-to-mode)))

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

(defface sw1nn/hs-fold-overlay-face
  '((t (:background "#fdf6e3" :foreground "#232323")))
  "Face for fold overlay"
  :group 'sw1nn/faces)

(use-package fold-dwim
  :ensure t
  :init (add-hook 'prog-mode-hook 'hs-minor-mode)
  :config
  (setq hs-set-up-overlay
        (defun sw1nn/display-code-line-counts (ov)
          (when (eq 'code (overlay-get ov 'hs))
            (overlay-put ov 'display
                         (propertize
                          (format " ⤵ <%03d>"
                                  (count-lines (overlay-start ov)
                                               (overlay-end ov)))
                          'face 'sw1nn/hs-fold-overlay-face))))))

(use-package win-switch
  :ensure t
  :config
  (setq win-switch-window-threshold 1
        win-switch-idle-time 0.7
        win-switch-feedback-background-color "#008800"
        win-switch-feedback-foreground-color "#00ff00"))


(use-package ido
  :ensure t
  :config
  (ido-mode)
  (ido-everywhere)
  (setq ido-auto-merge-work-directories-length -1
        ido-cannot-complete-command 'ignore
        ido-save-directory-list-file "~/.emacs.d/var/cache/ido.last"
        ido-use-virtual-buffers t))

(use-package ido-completing-read+
  :ensure t
  :config (ido-ubiquitous-mode))

(use-package ido-vertical-mode
  :ensure t
  :config (ido-vertical-mode)
  (setq ido-vertical-define-keys 'C-n-C-p-up-and-down))

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

;; (use-package uniquify
;;   :ensure t)

(use-package idle-highlight-mode
  :ensure t)

;; (use-package rainbow-mode
;;   :ensure t)

;; (use-package hideshowvis
;;   :ensure t
;;   :diminish hs-minor-mode)

(use-package rainbow-identifiers
  :ensure t)

;; (use-package beacon
;;   :ensure t
;;   :init (beacon-mode 1)
;;   :config
;;   (setq beacon-color "#cccec4")
;;   ;; Don't blink on specific major modes
;;   (append beacon-dont-blink-major-modes
;;           '(term-mode
;;             shell-mode
;;             eshell-mode
;;             help-mode
;;             ag-mode))

;;   ;; Don't blink on next-line/previous-line at the top/bottom of the window
;;   (add-to-list 'beacon-dont-blink-commands 'next-line)
;;   (add-to-list 'beacon-dont-blink-commands 'previous-line)
;;   :diminish beacon-mode)

;; (require 'mc-hide-unmatched-lines-mode)

(use-package fancy-narrow
  :ensure t
  :init (fancy-narrow-mode t))

(use-package guide-key
  :ensure t
  :init    (setq guide-key/guide-key-sequence
                 '("C-x r"     ; rectanges and registers
                   "C-x 4"     ; window commands
                   "C-x w"     ; alternative to M-s ...
                   "C-c @"     ; hs-hide-show mode
                   "C-c m"     ; multiple cursors
                   "C-c C-v"   ; cider
                   "C-c C-t"   ; verilog mode
                   org-mode "C-c C-x"))
  :config  (guide-key-mode t)
  :diminish guide-key-mode)

(use-package autoinsert
  :ensure t
  :init (auto-insert-mode t)
  :config
  (setq auto-insert-directory "~/.emacs.d/insert/")
  (add-to-list 'auto-insert-alist '(".*/tampermonkey-scripts/.*\\.js$" . "tampermonkey-header.js")))

(use-package midnight
  :defer 5
  :config
  (setq clean-buffer-list-kill-buffer-names
        '("*Annotate " "*Help*" "*Apropos*" "*Buffer List*" "*Compile-Log*"
          "*info*" "*vc*" "*vc-diff*" "*diff*"))
  (setq clean-buffer-list-kill-never-buffer-names
        '("*scratch*" "*Messages*")))

(use-package smartparens
  :ensure t)

(use-package multiple-cursors
  :ensure t)

(use-package aggressive-indent
  :pin melpa-stable
  :ensure t)

(use-package flycheck-pos-tip
  :ensure t
  :config
  (use-package flycheck
    :config
    (setq flycheck-display-errors-function 'flycheck-pos-tip-error-messages)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; look and feel tweaks
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode)
    (funcall mode -1)))

(if window-system
    (progn
      (setq frame-title-format '(buffer-file-name "%f" ("%b")))
      (tooltip-mode -1)
      (mouse-wheel-mode t)
      (blink-cursor-mode -1)))

(setq inhibit-splash-screen t)
(setq make-backup-files nil)
(setq default-directory "~/workspace")
(setq-default cursor-type 'bar)
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
      auto-save-default nil
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

(setq-default cursor-type t)

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

(add-hook 'dired-mode-hook
          #'auto-revert-mode)

(setq browse-url-browser-function 'browse-url-xdg-open)

(win-switch-setup-keys-ijkl "\C-xo" "\C-x\C-o")

(auto-compression-mode t)
(global-hl-line-mode t)
(put 'narrow-to-region 'disabled nil)

(windmove-default-keybindings)

(global-flycheck-mode)

(defadvice ido-find-file (after find-file-sudo activate)
  "Find file as root if necessary."
  (unless (and buffer-file-name
               (or (tramp-tramp-file-p buffer-file-name)
                   (not (file-exists-p buffer-file-name))
                   (file-writable-p buffer-file-name)))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(setenv "DISPLAY" ":0")
(setenv "XAUTHORITY" (concat (getenv "HOME") "/.Xauthority"))

;; make the fringe stand out from the background
(setq solarized-distinct-fringe-background t)

;; Don't change the font for some headings and titles
(setq solarized-use-variable-pitch nil)

;; make the modeline high contrast
;; (setq solarized-high-contrast-mode-line t)

;; Use less bolding
(setq solarized-use-less-bold t)

;; Use more italics
(setq solarized-use-more-italic t)

;; Use less colors for indicators such as git:gutter, flycheck and similar
(setq solarized-emphasize-indicators nil)

;; Don't change size of org-mode headlines (but keep other size-changes)
(setq solarized-scale-org-headlines nil)

;; Avoid all font-size changes
(setq solarized-height-minus-1 1)
(setq solarized-height-plus-1 1)
(setq solarized-height-plus-2 1)
(setq solarized-height-plus-3 1)
(setq solarized-height-plus-4 1)

;;(load-theme 'solarized-dark)

;; (load-theme 'sw1nn)

(use-package grandshell-theme :ensure t)
(load-theme 'grandshell)
