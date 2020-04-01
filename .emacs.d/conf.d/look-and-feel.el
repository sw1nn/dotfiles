(defvar sw1nn/todo "~/sync/todo.org")

(use-package expand-region
  :ensure t
  :bind
  ("M-2" . er/expand-region))

(use-package hideshow
  :diminish hs-minor-mode)

(use-package volatile-highlights
  :defer 5
  :config
  (volatile-highlights-mode t)
  :diminish volatile-highlights-mode)

(defvar electrify-return-match
  "[\]}\)\"]"
  "If this regexp matches the text after the cursor, do an \"electric\" return.")

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

(use-package saveplace
  :defer 5
  :config (setq save-place-file (concat user-emacs-directory "places"))
  :hook (prog-mode . save-place-mode))

(defface sw1nn/hs-fold-overlay-face
  '((t (:background "#fdf6e3" :foreground "#232323")))
  "Face for fold overlay"
  :group 'sw1nn/faces)

(use-package fold-dwim
  :ensure t
  :bind ("C-c M-f" . fold-dwim-toggle)
  :hook (prog-mode . hs-minor-mode)
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
  :config
  (setq win-switch-window-threshold 1
        win-switch-idle-time 0.7
        win-switch-feedback-background-color "#008800"
        win-switch-feedback-foreground-color "#00ff00"))

(use-package winner
  :defer nil
  :config
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
  :config (winner-mode))

(use-package browse-kill-ring)

(use-package ace-jump-mode
  :bind ("C-c SPC" . ace-jump-mode))

(use-package idle-highlight-mode
  :hook (prog-mode . idle-highlight-mode))

(use-package rainbow-mode
  :hook (prog-mode . rainbow-mode)
  :diminish rainbow-mode)

(use-package rainbow-identifiers
  :hook (prog-mode . rainbow-identifiers-mode)
  :diminish rainbow-identifiers-mode)

(use-package fancy-narrow
  :hook (prog-mode . fancy-narrow-mode))

(use-package autoinsert
  :init (auto-insert-mode t)
  :config
  (setq auto-insert-directory "~/.emacs.d/insert/")
  (add-to-list 'auto-insert-alist '(".*/tampermonkey-scripts/.*\\.js$" . "tampermonkey-header.js")))

(use-package midnight
  :defer 5
  :config
  (setq clean-buffer-list-kill-buffer-names
        '("*Annotate " "*Help*" "*Apropos*" "*Buffer List*" "*Compile-Log*"
          "*info*" "*vc*" "*vc-diff*" "*diff*")
	clean-buffer-list-kill-never-buffer-names
	'("*scratch*" "*Messages*")))

(use-package smartparens
  :diminish smartparens-mode)

(use-package multiple-cursors
  :config (define-prefix-command 'sw1nn/mc-map)
  :bind-keymap ("C-c m" . sw1nn/mc-map)
  :bind (("M-3" . mc/mark-next-like-this)
	 ("M-4" . mc/mark-previous-like-this)
	 ("C-x C-m" . mc/mark-all-dwim)
	 (:map sw1nn/mc-map
	       ("i"    . mc/insert-numbers)
	       ("h"    . mc-hide-unmatched-lines-mode)
	       ("a"    . mc/mark-all-like-this)
	       ("d"    . mc/mark-all-symbols-like-this-in-defun)
	       ("r"    . mc/reverse-regions)
	       ("s"    . mc/sort-regions)
	       ("l"    . mc/edit-lines)
	       ("\C-a" . mc/edit-beginnings-of-lines)
	       ("\C-e" . mc/edit-ends-of-lines))))

(use-package aggressive-indent
  :hook (prog-mode . aggressive-indent-mode)
  :diminish aggressive-indent-mode)

;; (use-package flycheck-pos-tip
;;   :ensure t)

(use-package flycheck
  :config
  (setq ;; flycheck-display-errors-function 'flycheck-pos-tip-error-messages
   flycheck-mode-line-prefix "🐜")
  :hook   (prog-mode . flycheck-mode))


(use-package helpful
  :init (setq counsel-describe-function-function #'helpful-callable
	      counsel-describe-variable-function #'helpful-variable))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; look and feel tweaks
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode)
    (funcall mode -1)))

(if window-system
    (progn
      (setq frame-title-format '(buffer-file-name "%f" ("%b"))
	    use-dialog-box nil)
      (tooltip-mode -1)
      (mouse-wheel-mode t)
      (blink-cursor-mode -1)))

;; encoding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(setq auth-sources `("~/.emacs.d/secrets/authinfo.gpg" "~/.netrc")
      auto-save-default nil
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      backup-directory-alist `((".*" . ,temporary-file-directory))
      compilation-always-kill t       ; kill compilation process before starting another
      compilation-ask-about-save nil  ; save all buffers on `compile'
      compilation-scroll-output 'first-error
      default-directory "~/workspace"
      echo-keystrokes 0.02
      fill-column 132
      inhibit-splash-screen t
      initial-buffer-choice sw1nn/todo
      make-backup-files nil
      same-window-regexps (quote '(("\\*magit: [[:ascii:]]\\*")))
      split-height-threshold nil
      split-width-threshold 160
      safe-local-variable-values '((eval when
					 (fboundp
					  (quote rainbow-mode))
					 (rainbow-mode 1))
				   (compilation-read-command)
				   (eval rainbow-mode t))
      tab-always-indent 'complete)

(setq custom-theme-directory (concat user-emacs-directory "themes"))

(setq-default apropos-do-all t
	      cursor-type 'bar
	      mouse-yank-at-point t
	      ring-bell-function #'ignore
	      save-interprogram-paste-before-kill t
	      uniquify-buffer-name-style 'forward
	      vc-follow-symlinks t ;; follow symlinks without asking
	      visible-bell nil
	      x-select-enable-clipboard t
	      x-select-enable-primary t
	      xterm-extra-capabilities '(modifyOtherKeys reportBackground getSelection setSelection)
	      xterm-query-timeout nil)

(add-hook 'compilation-filter-hook
	  (defun sw1nn/apply-ansi-color-to-compilation-buffer-h ()
	    "Applies ansi codes to the compilation buffers. Meant for `compilation-filter-hook'."
	    (with-silent-modifications
	      (ansi-color-apply-on-region compilation-filter-start (point)))))

(savehist-mode t)

(global-auto-revert-mode t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; die tabs, DIE!
(setq indent-tabs-mode nil)

(setq-default cursor-type t)

;; this lets us have a .dir-locals.el turning on rainbow-mode for themes.
(add-to-list 'safe-local-variable-values '(eval rainbow-mode t))
(add-to-list 'safe-local-variable-values
             '(compilation-read-command . nil))

(setq hscroll-margin 2
      hscroll-step 1
      ;; Emacs spends too much effort recentering the screen if you scroll the
      ;; cursor more than N lines past window edges (where N is the settings of
      ;; `scroll-conservatively'). This is especially slow in larger files
      ;; during large-scale scrolling commands. If kept over 100, the window is
      ;; never automatically recentered.
      scroll-conservatively 101
      scroll-margin 0
      scroll-preserve-screen-position t
      ;; Reduce cursor lag by a tiny bit by not auto-adjusting `window-vscroll'
      ;; for tall lines.
      auto-window-vscroll nil
      ;; mouse
      mouse-wheel-scroll-amount '(5 ((shift) . 2))
      mouse-wheel-progressive-speed nil)  ; don't accelerate scrolling

(setq dired-use-ls-dired nil)

(setq kill-do-not-save-duplicates t)

(setq recentf-save-file (concat user-emacs-directory ".recentf"))

;;; Fringes

;; Reduce the clutter in the fringes; we'd like to reserve that space for more
;; useful information, like git-gutter and flycheck.
(setq indicate-buffer-boundaries nil
      indicate-empty-lines nil)

;; make files opened in .jar etc read-only by default.
(add-hook 'archive-extract-hook
          (lambda nil
            (read-only-mode)))

(setq browse-url-browser-function 'browse-url-xdg-open)

(win-switch-setup-keys-ijkl "\C-xo" "\C-x\C-o")

(auto-compression-mode t)
(global-hl-line-mode t)
(put 'narrow-to-region 'disabled nil)

(setenv "DISPLAY" ":0")
(setenv "XAUTHORITY" (expand-file-name  "~/.Xauthority"))

(use-package doom-modeline
  :defer nil
  :init (setq doom-modeline-icon t)
  :config (doom-modeline-mode 1))

(use-package doom-themes
  :defer nil
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))
