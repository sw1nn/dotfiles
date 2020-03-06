;;; rust.el --- rust config                          -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Neale Swinnerton

;; Author: Neale Swinnerton <neale@sw1nn.com>
;; Keywords: abbrev

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


(use-package cargo
  :ensure t
  :defer t
  :config
  (add-hook 'cargo-process-mode-hook #'visual-line-mode))

(use-package rust-mode
  :ensure t
  :defer t
  :config
  (add-hook 'rust-mode-hook #'cargo-minor-mode)
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'rust-mode-hook #'smartparens-strict-mode)
  (add-hook 'rust-mode-hook #'flycheck-rust-setup)
  :bind (("C-m" . electrify-return-if-match)))


(use-package racer
  :ensure t
  :defer t
  :config
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  (setq racer-rust-src-path "/home/neale/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src")
  (setq racer-cmd "~/.cargo/bin/racer")
  :bind (:map racer-mode-map
              ([?\t] . company-indent-or-complete-common)
              ("C-c C-c d" . racer-describe)))

(advice-add 'xref-find-definitions :around
            'sw1nn/xref-auto-refresh-on-missing)


(provide 'rust)
;;; rust.el ends here
