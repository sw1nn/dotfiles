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


(use-package cargo)

(use-package flycheck-rust
  :after (rust-mode)
  :hook (flycheck-mode . flycheck-rust-setup))

(use-package rust-mode
  :hook ((rust-mode . smartparens-mode)
	 (rust-mode . origami-mode)
	 (rust-mode . lsp))
  :init (setq lsp-rust-server "rls";; "rustanalyzer"
	      ))


(provide 'rust)
;;; rust.el ends here
