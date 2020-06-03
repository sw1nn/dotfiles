(defgroup sw1nn nil
  "sw1nn customizations"
  :prefix "sw1nn/"
  :group 'applications)

(defcustom sw1nn/clj-compile-on-save t "non-nil means clj files should be compiled after save."
  :type 'boolean
  :group 'sw1nn)

(defcustom sw1nn/clj-test-on-save nil "non-nil means clj test files should be executed after save."
  :type 'boolean
  :group 'sw1nn)

(defcustom sw1nn/cljs-compile-on-save t "non-nil means cljs files should be compiled after save."
  :type 'boolean
  :group 'sw1nn
  :set nil)

(defun sw1nn/toggle-clj-compile-on-save ()
  (interactive)
  (setq sw1nn/clj-compile-on-save (not sw1nn/clj-compile-on-save))
  (message "sw1nn/clj-compile-on-save %s" (if sw1nn/clj-compile-on-save "enabled" "disabled")))

(defun sw1nn/toggle-cljs-compile-on-save ()
  (interactive)
  (setq sw1nn/cljs-compile-on-save (not sw1nn/cljs-compile-on-save))
  (message "sw1nn/cljs-compile-on-save %s" (if sw1nn/cljs-compile-on-save "enabled" "disabled")))

(defun sw1nn/toggle-clj-test-on-save ()
  (interactive)
  (setq sw1nn/clj-test-on-save (not sw1nn/clj-compile-on-save))
  (message "sw1nn/clj-test-on-save %s" (if sw1nn/clj-test-on-save "enabled" "disabled")))

;; from https://github.com/overtone/emacs-live/blob/master/packs/live/clojure-pack/config/paredit-conf.el#L19
(defun sw1nn/paredit-forward ()
  "Feels more natural to move to the beginning of the next item
   in the sexp, not the end of the current one."
  (interactive)
  (if (and (not (paredit-in-string-p))
           (save-excursion
             (ignore-errors
               (forward-sexp)
               (forward-sexp)
               t)))
      (progn
        (forward-sexp)
        (forward-sexp)
        (backward-sexp))
    (paredit-forward)))

(defun sw1nn/clj-compilable-file-p (filename)
  (and
   sw1nn/clj-compile-on-save
   (string= "clj" (file-name-extension filename))
   (not (string-match "project.clj"
                      (file-name-nondirectory filename)))
   (not (string-match ".lein/profiles.clj"
                      (substring filename (max (-(length filename)) -18))))))

(defun sw1nn/cljs-compilable-file-p (filename)
  (and
   sw1nn/cljs-compile-on-save
   (string= "cljs" (file-name-extension filename))))

(defun sw1nn/after-save-hook ()
  (when (and (boundp 'cider-mode)
             (symbol-value 'cider-mode)
             (or (sw1nn/clj-compilable-file-p (buffer-file-name))
                 (sw1nn/cljs-compilable-file-p (buffer-file-name))))
    (message "Compiling...")
    (cider-load-buffer)
    (if (and sw1nn/clj-test-on-save
             (assq 'clojure-test minor-mode-alist))
        (clojure-test-run-tests))))

(defun sw1nn/add-clj-compile-on-save ()
  (add-hook 'after-save-hook 'sw1nn/after-save-hook))

(defun sw1nn/toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(defun sw1nn/nrepl-current-server-buffer ()
  (let ((nrepl-server-buf (with-current-buffer (cider-current-repl-buffer)
                            nrepl-server-buffer)))
    (when nrepl-server-buf
      (get-buffer nrepl-server-buf))))

(defun sw1nn/clear-current-server-buffer ()
  "Clear current server buffer"
  (interactive)
:q (with-current-buffer (sw1nn/nrepl-current-server-buffer)
    (delete-region (point-min) (point-max))))

(defun sw1nn/show-maximum-output-current-server-buffer ()
  "Show the Maximum output in the current server buffer."
  (interactive)
  (with-current-buffer (sw1nn/nrepl-current-server-buffer)
    (goto-char (point-max))
    (let ((windows (get-buffer-window-list (current-buffer) nil t)))
      (while windows
        (set-window-point (car windows) (point-max))
        (setq windows (cdr windows))))))

(defun sw1nn/cider-perspective ()
  (interactive)
  (delete-other-windows)
  (split-window-below)
  (cider-switch-to-repl-buffer)
  (windmove-down)
  (shrink-window 15)
  (switch-to-buffer (sw1nn/nrepl-current-server-buffer))
  (windmove-up)
  (cider-switch-to-repl-buffer))

(defun sw1nn/run-cider-command (cmd)
  (with-current-buffer (cider-current-repl-buffer)
    (cider-repl-set-ns "user")
    (goto-char (point-max))
    (insert cmd)
    (cider-repl-return)))

(defun sw1nn/cider-reset (&optional dont-clear-server-buffer-p)
  (interactive "P")
  (save-some-buffers)
  (unless dont-clear-server-buffer-p
    (sw1nn/clear-current-server-buffer))
  (sw1nn/run-cider-command "(do (user/reset))"))

(defun sw1nn/toggle-transparency ()
  (interactive)
  (let ((param (cadr (frame-parameter nil 'alpha))))
    (if (and param (/= param 100))
        (set-frame-parameter nil 'alpha '(100 100))
      (set-frame-parameter nil 'alpha '(85 50)))))

(defun sw1nn/cqlsh ()
  (interactive)
  (let ((cql-buffer-name "*cqlsh*"))
    (if (get-buffer cql-buffer-name)
        (switch-to-buffer cql-buffer-name)
      (let ((multi-term-program "/bin/cqlsh"))
        (with-current-buffer (multi-term)
          (rename-buffer "*cqlsh*"))))))

(defun sw1nn/cider-run-tests ()
  (interactive)
  (save-some-buffers)
  (cider-test-run-tests))

;; from http://stackoverflow.com/questions/2416655/file-path-to-clipboard-in-emacs
(defun sw1nn/copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(defun sw1nn/json-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)))

(defun sw1nn/ansi-term ()
  (interactive)
  (if (and (boundp magit-toplevel)
	   (magit-toplevel))
      (magit-with-toplevel
       (ansi-term "/bin/zsh"))
    (ansi-term "/bin/zsh")))

(defun sw1nn/kludge-gpg-agent
    ()
  (if (display-graphic-p)
      (progn
        (setenv "DISPLAY" (terminal-name))
        (setenv "SSH_CONNECTION")
        (setenv "GPG_TTY"))
    (progn
      (setenv "GPG_TTY" (terminal-name))
      (setenv "DISPLAY" ":0"))))

(add-hook '
 window-configuration-change-hook 'sw1nn/kludge-gpg-agent)

(defun sw1nn/haskell-auto-insert-module-template ()
  "Insert a module template for the newly created buffer."
  (interactive)
  (when (and (= (point-min)
                (point-max))
             (buffer-file-name))
    (insert
     "-- | "
     "\n"
     "\n"
     "module "
     )
    (let ((name (haskell-guess-module-name)))
      (if (string= name "")
          (progn (insert "Main")
                 (shm-evaporate (- (point) 5)
                                (point)))
        (insert name)))
    (insert " where"
            "\n"
            "\n")
    (goto-char (point-min))
    (forward-char 4)))

(defun sw1nn/refresh-rusty-tags ()
  "Refresh rust project tags with rusty-tags."
  (interactive)
  (shell-command "rusty-tags emacs")
  (when-let ((cargo-root (locate-dominating-file (or buffer-file-name default-directory) "Cargo.toml")))
    (message "refreshing tags in %s" cargo-root)
    (let ((tags-revert-without-query t))
      (visit-tags-table (format "%s/rusty-tags.emacs" cargo-root) nil))))

(defun sw1nn/xref-auto-refresh-on-missing (oldfn &rest args)
  (condition-case err
      (apply oldfn args)
    (error (and (buffer-modified-p)
                (not (ding))
                (y-or-n-p "Buffer is modified, save it? ")
                (save-buffer))
           (when (string= major-mode "rust-mode")
             (sw1nn/refresh-rusty-tags))
           (apply oldfn args))))

(defun sw1nn/magit-find-file-completing-read-other-window ()
  "Find files using `magit-find-file-completing-read' and open in other window"
  (interactive)
  (magit-with-toplevel
    (find-file-other-window (magit-completing-read
                             (format "Find file in %s"
                                     (abbreviate-file-name default-directory))
                             (magit-find-file-files)))))

(defun sw1nn/magit-find-file-completing-read-other-frame ()
  "Find files using `magit-find-file-completing-read' and open in other window"
  (interactive)
  (magit-with-toplevel
    (find-file-other-frame (magit-completing-read
                            (format "Find file in %s"
                                    (abbreviate-file-name default-directory))
                            (magit-find-file-files)))))


(defun sw1nn/fill-paragraph-one-sentence-per-line (&optional justify region)
  "When called with prefix argument call `fill-paragraph'.
   Otherwise split the current paragraph into one sentence per
   line."
  (interactive "P")
  (if
      (save-excursion
        (let ((fill-column 12345678))
          ;; this will not work correctly if the paragraph is
          ;; longer than 12345678 characters (in which case the
          ;; file must be at least 12MB long. This is unlikely.)
          (fill-paragraph justify region)
          (let ((end (save-excursion
                       (forward-paragraph 1)
                       (backward-sentence)
                       (point-marker))))
            (beginning-of-line)
            (while (progn (forward-sentence)
                          (<= (point) (marker-position end)))
              (just-one-space)
              (delete-char -1)
              (newline)
              (indent-according-to-mode)))))
      (fill-paragraph justify region)))


(defun sw1nn/electic-dot-one-sentence-per-line ()
  (interactive)
  (insert ".\n"))

(defvar sw1nn/org-agenda-file  "agenda/sw1nn.org")
(defun sw1nn/org-agenda-sw1nn-toggle ()
  "Toggle presence of the `sw1nn-agenda-file` in `org-agenda-contributing-files`."
  (interactive)
  (let ((afile  (file-truename (concat org-directory "/" sw1nn/org-agenda-file))))
    (if (member afile (org-agenda-files t))
        (org-remove-file afile)
      (with-current-buffer (find-file-noselect afile)
        (org-agenda-file-to-front))))
  (org-agenda-redo))

(require 'browse-url) ;; TODO - can this be made to happen only if the sw1nn/browse fns are called?
(defun sw1nn/browse-url-emacs-as-json (url &optional _new-window)
  "Browse url in emacs, making assumption it's json, and pretty print"
  ;; TODO - do something clever with Content-Type from the HTTP request?
  (interactive (browse-url-interactive-arg "URL: "))
  (with-current-buffer (browse-url-emacs url)
    (js3-mode)
    (let ((inhibit-read-only t))
      (json-pretty-print-buffer)
      (not-modified))
    (unless (string-match "\.json$" (buffer-name))
      (rename-buffer (concat (buffer-name) ".json") :unique))))

(defun sw1nn/browse-url-emacs-as-csv (url &optional _new-window)
  "Browse url in emacs, making assumption it's csv, and pretty print"
  ;; TODO - do something clever with Content-Type from the HTTP request?
  (interactive (browse-url-interactive-arg "URL: "))
  (with-current-buffer (browse-url-emacs url)
    (csv-mode)
    (let ((inhibit-read-only t))
      (csv-align-mode)
      (not-modified))
    (unless (string-match "\.csv$" (buffer-name))
      (rename-buffer (concat (buffer-name) ".csv")))))


(provide 'sw1nn)
