;;; gh-profile.el --- profile support for gh.el

;; Copyright (C) 2013  Yann Hodique

;; Author: Yann Hodique <yann.hodique@gmail.com>
;; Keywords:

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;;

;;; Code:

(eval-when-compile
  (require 'cl))

;;;###autoload
(require 'eieio)

(defgroup gh-profile nil
  "Github profile."
  :group 'gh)

(defcustom gh-profile-default-url "https://api.github.com"
  "Default end point for API calls"
  :group 'gh-profile)

(defvar gh-profile-list nil)

(defclass gh-profile-class ()
  ((url :initarg :url :initform gh-profile-default-url)
   (username :initarg :username :initform nil)
   (password :initarg :password :initform nil)
   (oauth-token :initarg :oauth-token :initform nil)))

(defun gh-profile-define (name &rest args)
  (let ((profile (apply 'gh-profile-class name args)))
    (add-to-list gh-profile-list (cons name profile))))

(provide 'gh-profile)
;;; gh-profile.el ends here
