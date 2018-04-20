;;; arm.el --- routines for working with and debuggin ARM STM32 microprocessors  -*- lexical-binding: t; -*-

;; Copyright (C) 2017

;; Author:  <neale@alison.bal.sw1nn.com>
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
(defvar arm-gdb-openocd-buffer-name "*openocd*")
(defvar arm-gdb-itmdump-buffer-name "*itmdump*")

(defun tail-process-filter (proc string)
  (when (buffer-live-p (process-buffer proc))
    (with-current-buffer (process-buffer proc)
      (goto-char (process-mark proc))
      (let ((inhibit-read-only t))
        (insert string))
      (set-marker (process-mark proc) (point)))))

(defgroup openocd nil
  "OpenOCD")

(defcustom openocd-command-debug-level "2"
  "Debug level for openocd command."
  :type '(radio
          (const :tag "errors" "0")
          (const :tag "warnings" "1")
          (const :tag "information" "2")
          (const :tag "debug" "3"))
  :group 'openocd)

(defcustom openocd-command-files '("interface/stlink-v2-1.cfg" "target/stm32f3x.cfg")
  "Debug level for openocd command."
  :type '(repeat string)
  :group 'openocd)

(defvar openocd-banner-face 'openocd-banner-face)
(defvar openocd-debug-face 'openocd-debug-face)
(defvar openocd-info-face 'openocd-info-face)
(defvar openocd-warn-face 'openocd-warn-face)
(defvar openocd-error-face 'openocd-error-face)
(defvar openocd-number-face 'openocd-number-face)

(defface openocd-banner-face
  '((t (:weight bold :foreground "#123123")))
  "Face for openocd debug"
  :group 'openocd)

(defface openocd-debug-face
  '((t (:weight bold :foreground "white")))
  "Face for openocd debug"
  :group 'openocd)

(defface openocd-info-face
  '((t (:weight bold :foreground "#dddddd")))
  "Face for openocd info"
  :group 'openocd)

(defface openocd-warn-face
  '((t (:weight bold :foreground "yellow")))
  "Face for openocd warnings"
  :group 'openocd)

(defface openocd-error-face
  '((t (:weight bold :foreground "red")))
  "Face for openocd errors"
  :group 'openocd)

(defface openocd-number-face
  '((t (:foreground "blue")))
  "Face for openocd number"
  :group 'openocd)

(defvar openocd-font-lock-keywords
  '(
    ("^Debug" . openocd-debug-face)
    ("^Warn" . openocd-warn-face)
    ("^Info" . openocd-info-face)
    ("^Error" . openocd-error-face)
    ("\\(xPSR:\\)\s+\\(0x[[:xdigit:]]+\\)\s+\\(pc:\\)\s+\\(0x[[:xdigit:]]+\\)\s+\\(msp:\\)\s+\\(0x[[:xdigit:]]+\\)"
     (1 font-lock-keyword-face)
     (2 openocd-number-face)
     (3 font-lock-keyword-face)
     (4 openocd-number-face)
     (5 font-lock-keyword-face)
     (6 openocd-number-face))
    ("\\<\\(\\(?:tc\\|ud\\)p\\|\\(?:[[:digit:]]+\s+[kKmMGg]Hz\\)\\|\\(?:[[:digit:]]+[kKmMGg]bytes\\|Thread\\|STLINK\\|JTAG\\|API\\|SWIM\\|VID\\|PID\\)\\)\\>"
     (1 font-lock-keyword-face))
    ("\\(0x[[:xdigit:]]+\\|[[:digit:]]+\\(?:\\.[[:digit:]]+\\)?\\)" . openocd-number-face)
    ("\\(\"[^\"]+\"\\|'[^']+'\\)" . font-lock-string-face)
    )
  "Expressions to highlight in OpenOCD mode.")

(define-derived-mode openocd-mode comint-mode "openocd"
  "Mode for output of openocd."
  (kill-all-local-variables)
  (setq-local font-lock-defaults '(openocd-font-lock-keywords t))
  (setq-local scroll-margin 0)
  (view-mode))

(define-derived-mode itm-mode comint-mode "itm"
  "Mode for output of itmdump."
  (view-mode))

(defun kill-buffer-with-process-no-query (buffer)
  "Kill BUFFER that has a process with no query."
  (when-let ((proc (get-buffer-process buffer)))
    (set-process-query-on-exit-flag proc nil)
    (kill-buffer buffer)))

(defun kill-arm-gdb-other-buffers ()
  "Kill the support buffers."
  (interactive)
  (message "Killing openocd and itmpdump processes")

  (kill-buffer-with-process-no-query (get-buffer arm-gdb-openocd-buffer-name))
  (kill-buffer-with-process-no-query (get-buffer arm-gdb-itmdump-buffer-name)))

(defun build-openocd-command ()
  "Build the openocd command."
  (append (list "openocd" (concat "--debug=" openocd-command-debug-level))
          (seq-mapcat (lambda (el) (list "--file" el)) openocd-command-files)))

(defun create-openocd-process ()
  "Create the openocd process."
  (let ((buffer (get-buffer-create arm-gdb-openocd-buffer-name)))
    (make-process :name "openocd"
                  :buffer buffer
                  :command (build-openocd-command)
                  :sentinel (lambda (_ event)
                              (when (string-match "\\(hangup\\|terminated\\)\n" event )
                                (kill-arm-gdb-other-buffers))))
    (with-current-buffer buffer
      (openocd-mode))))


(defun create-itmdump-process ()
  "Create the itmdump process."
  (let ((buffer (get-buffer-create arm-gdb-itmdump-buffer-name)))
    (make-process :name "itmdump"
                  :buffer arm-gdb-itmdump-buffer-name
                  :command '("itmdump" "itm.txt")
                  :filter #'tail-process-filter
                  )
    (with-current-buffer buffer
      (itm-mode))))

(defun arm-gdb-create-support-buffers ()
  "Create the support buffers for arm-gdb."
  (interactive)
  (unless (get-buffer arm-gdb-openocd-buffer-name)
    (create-openocd-process))

  (unless (get-buffer arm-gdb-itmdump-buffer-name)
    (create-itmdump-process)))

(defun arm-gdb ()
  "Run gdb with arm cmdline."
  (interactive)
  (with-current-buffer (current-buffer)
    (setq default-directory (cargo-process--project-root))
    (arm-gdb-create-support-buffers)

    (gdb (gud-query-cmdline 'gdb))
    (arm-gdb-setup-windows)))

(defun arm-gdb-setup-windows ()
  "Layout the window pattern for arm microprocessor."
  (interactive)
  (gdb-get-buffer-create 'gdb-locals-buffer)
  (gdb-get-buffer-create 'gdb-stack-buffer)
  (gdb-get-buffer-create 'gdb-breakpoints-buffer)
  (set-window-dedicated-p (selected-window) nil)
  (switch-to-buffer gud-comint-buffer)
  (delete-other-windows)
  (let ((win0 (selected-window))
        (win1 (split-window nil ( / ( * (window-height) 3) 4)))
        (win2 (split-window nil ( / (window-height) 3)))
        (win3 (split-window-right)))
    (gdb-set-window-buffer (gdb-locals-buffer-name) nil win3)
    (select-window win2)
    (set-window-buffer
     win2
     (if gud-last-last-frame
         (gud-find-file (car gud-last-last-frame))
       (if gdb-main-file
           (gud-find-file gdb-main-file)
         ;; Put buffer list in window if we
         ;; can't find a source file.
         (list-buffers-noselect))))
    (setq gdb-source-window (selected-window))
    (let ((openocd (split-window-right)))
      (gdb-set-window-buffer "*openocd*" nil openocd)
      (select-window openocd))
    (let ((itmdump (split-window)))
      (gdb-set-window-buffer "*itmdump*" nil itmdump))
    (select-window win1)
    (gdb-set-window-buffer (gdb-stack-buffer-name))
    (let ((win5 (split-window-right)))
      (gdb-set-window-buffer (if gdb-show-threads-by-default
                                 (gdb-threads-buffer-name)
                               (gdb-breakpoints-buffer-name))
                             nil win5))
    (select-window win0)))

(provide 'arm)
;;; arm.el ends here
