;;; sw1nn-theme.el --- sw1nn theme                      -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Neale Swinnerton

;; Author: Neale Swinnerton <neale@sw1nn.com>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(deftheme sw1nn
  "Created 2013-03-25.")

(custom-theme-set-faces
 'sw1nn
 '(cidr-repl-err-output-face ((t (:foreground "#8b0000"))))
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
 '(fancy-narrow-blocked-face ((t (:foreground "#464646"))))
 '(flymake-warnline ((t (:underline (:color "#8b7500" :style wave) :inherit nil))))
 '(flyspell-duplicate ((t (:underline (:color "#8b7500" :style wave) :inherit nil))))
 '(flymake-errline ((t (:underline (:color "#8b0000" :style wave) :inherit nil))))
 '(flyspell-incorrect ((t (:underline (:color "#8b0000" :style wave) :inherit nil))))
 '(font-lock-builtin-face ((t (:foreground "#5859b7"))))
 '(font-lock-comment-delimiter-face ((t (:slant italic :foreground "#657b83") :inherit font-lock-comment-face)))
 '(font-lock-comment-face ((t (:slant italic :foreground "#586e75"))))
 '(font-lock-constant-face ((t (:foreground "#a57705"))))
 '(font-lock-doc-face ((t (:foreground "#259185"))))
 '(font-lock-doc-string-face ((t (:foreground "#2075c7"))))
 '(font-lock-function-name-face ((t (:foreground "#2075c7"))))
 '(font-lock-keyword-face ((t (:foreground "#728a05"))))
 '(font-lock-preprocessor-face ((t (:foreground "#d33682"))))
 '(font-lock-regexp-grouping-backslash ((t (:weight bold :foreground "#2aa198") :inherit bold)))
 '(font-lock-regexp-grouping-construct ((t (:weight bold :foreground "#6c71c4") :inherit bold)))
 '(font-lock-string-face ((t (:foreground "#259185"))))
 '(font-lock-type-face ((t (:foreground "#a57705"))))
 '(font-lock-variable-name-face ((t (:foreground "#859900"))))
 '(fringe ((t (:background "#000000"))))
 '(git-gutter-fr:added ((t (:foreground "#859900"))))
 '(git-gutter-fr:deleted ((t (:foreground "#dc322f"))))
 '(git-gutter-fr:modified ((t (:foreground "#6c71c4"))))
 '(highlight ((t (:background "#000000"))))
 '(header-line ((t (:inherit mode-line :background "grey20" :foreground "grey90" :box (:line-width 2 :color "grey75" :style released-button)))))
 '(hl-line-face ((t (:background "#073642"))))
 '(hl-sexp-face ((t (:background "#073642"))))
 '(hs-fringe-face ((t (:background "selectedTextBackgroundColor" :foreground "#222" :box (:line-width 2 :color "grey75" :style released-button)))))
 '(ibuffer-marked-face ((t (:inherit font-lock-type-face))))
 '(ido-first-match ((t (:weight bold :foreground "#b58900"))))
 '(ido-only-match ((t (:foreground "#728a05"))))
 '(ido-subdir ((t (:foreground "#cb4b16"))))
 '(isearch ((t (:background "#073642" :foreground "#b58900" :inverse-video t))))
 '(isearch-fail ((t (:background "#bb0000" :foreground "#b58900" :inverse-video t)))
                )
 '(lazy-highlight ((t (:inverse-video t :foreground "#259185" :background "#042028"))))
 '(magit-diff-added ((t (:foreground "#004400"))))
 '(magit-diff-added-highlight ((t (:inherit diff-added))))
 '(magit-diff-context-highlight ((t (:background "#00000" :foreground "grey30"))))
 '(magit-diff-hunk-heading ((t (:background "#073642" :foreground "grey75"))))
 '(magit-diff-hunk-heading-highlight ((t (:background "#657b83" :foreground "grey85"))))
 '(magit-diff-removed ((t (:foreground "#2A0000"))))
 '(magit-diff-removed-highlight ((t (:inherit diff-removed))))
 '(magit-log-graph ((t (:foreground "#657b83"))))
 '(magit-section-highlight ((t (:weight bold))))
 '(match ((t (:inverse-video t :foreground "#2075c7" :background "#00005f"))))
 '(mode-line ((t (:background "#5f005f" :foreground "plum" :box (:line-width -1 :style released-button)))))
 '(mode-line-inactive ((t (:inherit mode-line :background "#839496" :foreground "#000000" :box (:line-width -1 :color "grey40") :weight light))))
 '(mc/cursor-face ((t (:background "#268bd2" :foreground "LightSteelBlue2"))))
 '(minibuffer-prompt ((t (:foreground "#268bd2"))))
 '(nrepl-eval-sexp-fu-flash-face ((t (:inverse-video t :inherit default))))
 '(region ((t (:background "#586e75"))))
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
 ;; '(org-agenda-structure ((t (:inherit default ,@ha/variable-font-tuple :height 2.0 :underline nil))))
 ;; '(org-verbatim ((t (:inherit 'fixed-pitched :foreground "#aef"))))
 ;; '(org-table ((t (:inherit 'fixed-pitched ,@ha/fixed-font-tuple))))
 ;; '(org-block ((t (:inherit 'fixed-pitched ,@ha/fixed-font-tuple))))
 ;; '(org-block-background ((t (:inherit 'fixed-pitched ,@ha/fixed-font-tuple))))
 ;; '(org-block-begin-line ((t (:inherit 'fixed-pitched ,@ha/fixed-font-tuple))))
 ;; '(org-block-end-line ((t (:inherit 'fixed-pitched ,@ha/fixed-font-tuple))))
 '(org-level-8 ((t (:weight bold :family "Georgia"))))
 '(org-level-7 ((t (:weight bold :family "Georgia"))))
 '(org-level-6 ((t (:weight bold :family "Georgia"))))
 '(org-level-5 ((t (:weight bold :family "Georgia"))))
 '(org-level-4 ((t (:weight bold :family "Georgia" :height 1.1))))
 '(org-level-3 ((t (:weight bold :family "Georgia" :height 1.25))))
 '(org-level-2 ((t (:weight bold :family "Georgia" :height 1.5))))
 '(org-level-1 ((t (:weight bold :family "Georgia" :height 1.75))))
 '(org-document-title ((t (:weight bold :family "Georgia" :height 1.5 :underline nil))))
 '(default ((t (:family "Fira Code")))))

(provide 'sw1nn-theme)
;;; sw1nn-theme.el ends here
