(deftheme sw1nn
  "Created 2013-03-25.")

(custom-theme-set-faces
 'sw1nn
 '(clojure-character-face ((t (:foreground "#cb4b16") :inherit font-lock-doc-face)))
 '(clojure-keyword-face ((t (:foreground "#00CC33") :inherit font-lock-doc-face)))
 '(clojure-interop-method-face ((t (:foreground "#eeeeee") :inherit font-lock-doc-face)))
 '(compilation-column-number ((t (:foreground "#a57705") :inherit font-lock-doc-face)))
 '(compilation-error ((t (:underline (:color "#8b0000" :style wave)))))
 '(compilation-info ((t (:underline (:color "#008b00" :style wave)))))
 '(compilation-line-number ((t (:foreground "#259185") :inherit font-lock-keyword-face)))
 '(cursor ((t (:background "#b3ee3a"))))
 '(diff-context ((t (:foreground "#666666"))))
 '(diff-file-header ((t (:background "#121212" :weight bold))))
 '(diff-added ((t (:inherit diff-changed :background "#005500" :foreground "#00CC33"))))
 '(diff-changed ((t (:inherit diff-changed :background "#555500" :foreground "#777700"))))
 '(diff-removed ((t (:inherit diff-changed :background "#2a0000" :foreground "#FF0000"))))
 '(diff-context ((t (:background "#073642"))))
 '(diff-header ((t (:background "#464646"))))
 '(diff-refine-added ((t (:inherit diff-refine-change :background "#007700"))))
 '(diff-refine-change ((t (:background "#ab730a"))))
 '(diff-refine-removed ((t (:inherit diff-refine-change :background "#802222"))))
 '(diff-removed ((t (:foreground "#FF0000" :background "#550000"))))
 '(eldoc-highlight-function-argument ((t (:foreground "#859900" :weight bold))))
 '(erc-notice-face ((t (:foreground "#333333"))))
 '(erc-input-face ((t (:foreground "white"))))
 '(erc-my-nick-face ((t (:foreground "chartreuse" :weight bold))))
 '(error ((t (:inherit nil :underline (:color "#8b0000" :style wave)))))
 '(flymake-warnline ((t (:underline (:color "#8b7500" :style wave) :inherit nil))))
 '(flyspell-duplicate ((t (:underline (:color "#8b7500" :style wave) :inherit nil))))
 '(flymake-errline ((t (:underline (:color "#8b0000" :style wave) :inherit nil))))
 '(flyspell-incorrect ((t (:underline (:color "#8b0000" :style wave) :inherit nil))))
 '(font-lock-builtin-face ((t (:foreground "#5859b7"))))
 '(font-lock-comment-delimiter-face ((t (:slant italic :foreground "#465a61") :inherit font-lock-comment-face)))
 '(font-lock-comment-face ((t (:slant italic :foreground "#00aa00"))))
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
 '(fringe ((t (:background "#000000"))))
 '(git-gutter-fr:added ((t (:foreground "#728a05"))))
 '(git-gutter-fr:deleted ((t (:foreground "#8b0000"))))
 '(git-gutter-fr:modified ((t (:foreground "#5859b7"))))
 '(highlight ((t (:background "#000000"))))
 '(header-line ((t (:inherit mode-line :background "grey20" :foreground "grey90" :box (:line-width 2 :color "grey75" :style released-button)))))
 '(hl-line-face ((t (:background "#073642"))))
 '(hl-sexp-face ((t (:background "#073642"))))
 '(hs-fringe-face ((t (:background "selectedTextBackgroundColor" :foreground "#222" :box (:line-width 2 :color "grey75" :style released-button)))))
 '(ibuffer-marked-face ((t (:inherit font-lock-type-face))))
 '(ido-first-match ((t (:weight bold :foreground "#a57705"))))
 '(ido-only-match ((t (:foreground "#728a05"))))
 '(ido-subdir ((t (:foreground "#c61b6e"))))
 '(info-header-node ((t (:foreground "#00688b") :inherit info-node)))
 '(info-header-xref ((t (:foreground "#4eee94") :inherit info-xref)))
 '(info-menu-header ((t (:family "helv" :weight bold) :inherit variable-pitch)))
 '(info-title-1 ((t (:height 1.2) :inherit info-title-2)))
 '(info-title-2 ((t (:height 1.2) :inherit info-title-3)))
 '(info-title-3 ((t (:family "helv" :height 1.2 :weight bold) :inherit info-title-4)))
 '(info-title-4 ((t nil (:inherit variable-pitch))))
 '(isearch ((t (:background "#042028" :foreground "#a57705" :inverse-video t))))
 '(lazy-highlight ((t (:inverse-video t :foreground "#259185" :background "#042028"))))
 '(magit-branch ((t (:foreground "#006400" :background "#b3ee3a"))))
 '(magit-item-highlight ((t (:inherit nil :background "#073642"))))
 '(magit-item-mark ((t (:inherit highlight :box (:line-width 2 :color "light green")))))
 '(magit-key-mode-switch-face ((t (:inherit nil :foreground "#008b00"))))
 '(magit-log-head-label-default ((t (:background "#222222" :foreground "#002b86" :box 1))))
 '(magit-log-reflog-label-other ((t (:background "#222222" :foreground "#002b86" :box 1))))
 '(magit-log-reflog-label-remote ((t (:background "#222222" :foreground "#002b86" :box 1))))
 '(match ((t (:inverse-video t :foreground "#2075c7" :background "#00005f"))))
 '(magit-key-mode-switch-face ((t (:foreground "green" :weight bold))))
 '(mc/cursor-face ((t (:background "DodgerBlue4" :foreground "LightSteelBlue2"))))
 '(mode-line ((t (:background "#5f005f" :foreground "plum" :box (:line-width -1 :style released-button)))))
 '(mode-line-inactive ((t (:inherit mode-line :background "#2f002f" :foreground "#7f007f" :box (:line-width -1 :color "grey40") :weight light))))
 '(minibuffer-prompt ((t (:foreground "#2075c7"))))
 '(cider-error-highlight-face ((t (:underline (:color "#8b0000" :style wave) :inherit nil))))
 '(cider-warning-highlight-face ((t (:underline (:color "#8b7500" :style wave) :inherit nil))))
 '(nrepl-eval-sexp-fu-flash-face ((t (:inverse-video t :inherit default))))
 '(outline-3 ((t (:foreground "#728a05") :inherit nil)))
 '(outline-4 ((t (:slant normal :foreground "#52676f"))))
 '(powerline-active1 ((t (:inherit mode-line :background "#b3ee3a" :foreground "#006400"))))
 '(region ((t (:background "#e9e2cb"))))
 '(secondary-selection ((t (:background "#00688b" :foreground "#002b86"))))
 '(show-paren-match ((t (:inverse-video t :foreground "white" :background "#1e90ff"))))
 '(show-paren-mismatch ((t (:foreground "#042028" :background "#c61b6e"))))
 '(term-color-black ((t (:background "#002b36" :foreground "#073642"))))
 '(term-color-blue ((t (:background "#839496" :foreground "#268bd2"))))
 '(term-color-cyan ((t (:background "#93a1a1" :foreground "#2aa198"))))
 '(term-color-green ((t (:background "#586e75" :foreground "#859900"))))
 '(term-color-magenta ((t (:background "#6c71c4" :foreground "#d33682"))))
 '(term-color-red ((t (:background "#cb4b16" :foreground "#dc322f"))))
 '(term-color-white ((t (:background "#fdf6e3" :foreground "#eee8d5"))))
 '(term-color-yellow ((t (:background "#657b83" :foreground "#b58900"))))
 '(warning ((t (:underline (:color "#8b0000" :style wave)))))
 '(widget-field ((t (:background "#aaaaaa" :foreground "#002b36"))))
 '(widget-single-line-field ((t (:background "#222222" :foreground "#002b36"))))
 '(default ((t (:family "DejaVu Sans Mono for Powerline")))))
(provide-theme 'sw1nn)
