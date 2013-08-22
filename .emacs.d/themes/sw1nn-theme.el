(deftheme sw1nn
  "Created 2013-03-25.")

(custom-theme-set-faces
 'sw1nn
 '(compilation-column-number ((t (:foreground "#a57705") :inherit font-lock-doc-face)))
 '(compilation-error ((t (:underline (:color "Red4" :style wave)))))
 '(compilation-info ((t (:underline (:color "Green4" :style wave)))))
 '(compilation-line-number ((t (:foreground "#259185") :inherit font-lock-keyword-face)))
 '(cursor ((t (:background "OliveDrab2"))))
 '(diff-added ((t (:foreground "#00CC33"))))
 '(diff-context ((t (:foreground "#666666"))))
 '(diff-file-header ((t (:background "#121212" :weight bold))))
 '(diff-header ((t (:background "grey15"))))
 '(diff-refine-added ((t (:inherit diff-refine-change :background "PaleGreen4"))))
 '(diff-refine-change ((t (:background "DarkGoldenrod3"))))
 '(diff-refine-removed ((t (:inherit diff-refine-change :background "IndianRed3"))))
 '(diff-removed ((t (:foreground "#FF0000"))))
 '(eldoc-highlight-function-argument ((t (:foreground "#859900" :weight bold))))
 '(erc-notice-face ((t (:foreground "gray20"))))
 '(flymake-errline ((t (:underline (:color "Red4" :style wave) :inherit nil))))
 '(flymake-warnline ((t (:underline (:color "Gold4" :style wave) :inherit nil))))
 '(flyspell-duplicate ((t (:underline (:color "Gold4" :style wave) :inherit nil))))
 '(flyspell-incorrect ((t (:underline (:color "Red4" :style wave) :inherit nil))))
 '(font-lock-builtin-face ((t (:foreground "#5859b7"))))
 '(font-lock-comment-delimiter-face ((t (:slant italic :foreground "#465a61") :inherit font-lock-comment-face)))
 '(font-lock-comment-face ((t (:slant italic :foreground "#52676f"))))
 '(font-lock-constant-face ((t (:foreground "#a57705"))))
 '(font-lock-doc-face ((t (:foreground "#259185"))))
 '(font-lock-doc-string-face ((t (:foreground "#2075c7"))))
 '(font-lock-function-name-face ((t (:foreground "#2075c7"))))
 '(font-lock-keyword-face ((t (:foreground "#728a05"))))
 '(font-lock-preprocessor-face ((t (:foreground "#c61b6e"))))
 '(font-lock-regexp-grouping-backslash ((t (:weight bold :foreground "#c61b6e") :inherit bold)))
 '(font-lock-regexp-grouping-construct ((t (:weight bold :foreground "#5859b7") :inherit bold)))
 '(font-lock-string-face ((t (:foreground "#259185"))))
 '(font-lock-type-face ((t (:foreground "#a57705"))))
 '(font-lock-variable-name-face ((t (:foreground "#859900"))))
 '(font-lock-warning-face ((t (:underline (:color "Red4" :style wave)))))
 '(fringe ((t (:background "#0a2832"))))
 '(git-gutter-fr:added ((t (:foreground "#728a05"))))
 '(git-gutter-fr:deleted ((t (:foreground "Red4"))))
 '(git-gutter-fr:modified ((t (:foreground "#5859b7"))))
 '(highlight ((t (:background "#0a2832"))))
 '(hl-line-face ((t (:background "#1b3943"))))
 '(hl-sexp-face ((t (:inherit highlight))))
 '(ido-first-match ((t (:weight bold :foreground "#a57705"))))
 '(ido-only-match ((t (:foreground "#728a05"))))
 '(ido-subdir ((t (:foreground "#c61b6e"))))
 '(info-header-node ((t (:foreground "DeepSkyBlue1") :inherit info-node)))
 '(info-header-xref ((t (:foreground "SeaGreen2") :inherit info-xref)))
 '(info-menu-header ((t (:family "helv" :weight bold) :inherit variable-pitch)))
 '(info-title-1 ((t (:height 1.2) :inherit info-title-2)))
 '(info-title-2 ((t (:height 1.2) :inherit info-title-3)))
 '(info-title-3 ((t (:family "helv" :height 1.2 :weight bold) :inherit info-title-4)))
 '(info-title-4 ((t nil (:inherit variable-pitch))))
 '(isearch ((t (:background "#042028" :foreground "#a57705" :inverse-video t))))
 '(lazy-highlight ((t (:inverse-video t :foreground "#259185" :background "#042028"))))
 '(magit-branch ((t (:foreground "DarkGreen" :background "OliveDrab2"))))
 '(magit-item-highlight ((t (:inherit nil))))
 '(match ((t (:inverse-video t :foreground "#2075c7" :background "#042028"))))
 '(minibuffer-prompt ((t (:foreground "#2075c7"))))
 '(nrepl-error-highlight-face ((t (:underline (:color "Red4" :style wave) :inherit nil))))
 '(nrepl-warning-highlight-face ((t (:underline (:color "Gold4" :style wave) :inherit nil))))
 '(outline-3 ((t (:foreground "#728a05") :inherit nil)))
 '(outline-4 ((t (:slant normal :foreground "#52676f"))))
 '(powerline-active1 ((t (:inherit mode-line :background "OliveDrab2" :foreground "DarkGreen"))))
 '(region ((t (:background "#e9e2cb"))))
 '(show-paren-match ((t (:inverse-video t :foreground "white" :background "dodgerblue1"))))
 '(show-paren-mismatch ((t (:foreground "#042028" :background "#c61b6e"))))
 '(warning ((t (:underline (:color "Red4" :style wave)))))
 '(default ((t (:background "#042028" :foreground "#708183" :height 160 :family "DejaVu Sans Mono for Powerline")))))

(provide-theme 'sw1nn)
