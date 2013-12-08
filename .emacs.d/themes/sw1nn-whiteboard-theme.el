;;; whiteboard-theme.el --- Custom theme for faces

;; Copyright (C) 2011-2013 Free Software Foundation, Inc.

;; Author: Scott Frazer <frazer.scott@gmail.com>

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(deftheme sw1nn-whiteboard
  "Face colors similar to markers on a whiteboard.")

(custom-theme-set-faces
 'sw1nn-whiteboard
 '(Info-title-1-face ((t (:family "helv" :weight bold :height 1.728))))
 '(Info-title-2-face ((t (:family "helv" :weight bold :height 1.44))))
 '(Info-title-3-face ((t (:family "helv" :weight bold :height 1.2))))
 '(Info-title-4-face ((t (:family "helv" :weight bold))))
 '(compilation-column-number ((t (:foreground "DarkGreen"))))
 '(compilation-error ((t (:foreground "Red1"))))
 '(compilation-info ((t (:weight normal :foreground "DeepSkyBlue4"))))
 '(compilation-line-number ((t (:foreground "DarkGreen"))))
 '(cperl-array-face ((t (:foreground "SlateBlue3"))))
 '(cperl-hash-face ((t (:foreground "turquoise3"))))
 '(cperl-nonoverridable-face ((t (:foreground "orchid3"))))
 '(cursor ((t (:background "Green4"))))
 '(default ((t (:background "whitesmoke" :foreground "black" :height 200 :family "DejaVu Sans Mono for Powerline"))))
 '(dired-marked ((t (:background "dodgerblue3" :foreground "white"))))
 '(flymake-errline ((t (:background nil :underline "red"))))
 '(flymake-warnline ((t (:background nil :underline "magenta3"))))
 '(font-lock-builtin-face ((t (:foreground "DarkOrange3"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "gray50"))))
 '(font-lock-comment-face ((t (:foreground "gray50"))))
 '(font-lock-constant-face ((t (:foreground "DarkOliveGreen4"))))
 '(font-lock-doc-face ((t (:foreground "peru"))))
 '(font-lock-doc-string-face ((t (:foreground "peru"))))
 '(font-lock-function-name-face ((t (:foreground "goldenrod3"))))
 '(font-lock-keyword-face ((t (:foreground "DodgerBlue2"))))
 '(font-lock-preprocessor-face ((t (:foreground "gold3"))))
 '(font-lock-reference-face ((t (:foreground "salmon"))))
 '(font-lock-regexp-grouping-backslash ((t (:weight bold))))
 '(font-lock-regexp-grouping-construct ((t (:weight bold))))
 '(font-lock-string-face ((t (:foreground "burlywood4"))))
 '(font-lock-type-face ((t (:foreground "DeepSkyBlue4"))))
 '(font-lock-variable-name-face ((t (:foreground "SeaGreen4"))))
 '(font-lock-warning-face ((t (:foreground "red"))))
 '(fringe ((t (:background "gainsboro"))))
 '(highlight ((t (:background "gray95"))))
 '(ido-first-match ((t (:weight normal :foreground "DarkOrange3"))))
 '(ido-only-match ((t (:foreground "SeaGreen4"))))
 '(ido-subdir ((t (:foreground nil :inherit font-lock-keyword-face))))
 '(info-header-node ((t (:foreground "DeepSkyBlue1"))))
 '(info-header-xref ((t (:foreground "SeaGreen2"))))
 '(info-menu-header ((t (:family "helv" :weight bold))))
 '(info-node ((t (:foreground "DeepSkyBlue1"))))
 '(info-xref ((t (:foreground "SeaGreen4"))))
 '(isearch ((t (:background "coral2" :foreground "white"))))
 '(isearch-lazy-highlight-face ((t (:background "coral4" :foreground "white"))))
 '(lazy-highlight ((t (:background "cadetblue" :foreground "white"))))
 '(match ((t (:background "LightPink1"))))
 '(minibuffer-prompt ((t (:foreground "DodgerBlue4"))))
 '(mode-line ((t (:background "gray75" :foreground "black" :box (:line-width 1 :style released-button)))))
 '(mode-line-buffer-id ((t (:weight bold :background nil :foreground "blue4"))))
 '(mode-line-inactive ((t (:background "gray40" :foreground "black" :box (:line-width 1 :color "gray40" :style nil)))))
 '(outline-1 ((t (:foreground "Blue3"))))
 '(outline-2 ((t (:foreground "DodgerBlue"))))
 '(outline-3 ((t (:foreground "SteelBlue"))))
 '(outline-4 ((t (:foreground "RoyalBlue"))))
 '(outline-5 ((t (:foreground "DeepSkyBlue"))))
 '(primary-selection ((t (:background "blue3"))))
 '(region ((t (:background "SkyBlue1"))))
 '(show-paren-match-face ((t (:background "dodgerblue1" :foreground "white"))))
 '(show-paren-mismatch-face ((t (:background "red1" :foreground "white")))))

(provide-theme 'sw1nn-whiteboard)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; whiteboard-theme.el ends here
