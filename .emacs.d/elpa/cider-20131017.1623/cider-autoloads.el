;;; cider-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "cider" "cider.el" (21089 18451 0 0))
;;; Generated autoloads from cider.el

(defalias 'cider 'nrepl)

(defalias 'cider-jack-in 'nrepl-jack-in)

(eval-after-load 'clojure-mode '(progn (define-key clojure-mode-map (kbd "C-c M-j") 'nrepl-jack-in) (define-key clojure-mode-map (kbd "C-c M-c") 'nrepl)))

;;;***

;;;### (autoloads nil "cider-interaction-mode" "cider-interaction-mode.el"
;;;;;;  (21089 18451 0 0))
;;; Generated autoloads from cider-interaction-mode.el

(autoload 'cider-interaction-mode "cider-interaction-mode" "\
Minor mode for REPL interaction from a Clojure buffer.

\\{cider-interaction-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "nrepl-client" "nrepl-client.el" (21089 18451
;;;;;;  0 0))
;;; Generated autoloads from nrepl-client.el

(autoload 'nrepl-enable-on-existing-clojure-buffers "nrepl-client" "\
Enable interaction mode on existing Clojure buffers.
See command `nrepl-interaction-mode'.

\(fn)" t nil)

(autoload 'nrepl-disable-on-existing-clojure-buffers "nrepl-client" "\
Disable interaction mode on existing Clojure buffers.
See command `nrepl-interaction-mode'.

\(fn)" t nil)

(autoload 'nrepl-jack-in "nrepl-client" "\
Start a nREPL server for the current project and connect to it.
If PROMPT-PROJECT is t, then prompt for the project for which to
start the server.

\(fn &optional PROMPT-PROJECT)" t nil)

(add-hook 'nrepl-connected-hook 'nrepl-enable-on-existing-clojure-buffers)

(autoload 'nrepl "nrepl-client" "\
Connect nrepl to HOST and PORT.

\(fn HOST PORT)" t nil)

;;;***

;;;### (autoloads nil nil ("cider-eldoc.el" "cider-interaction.el"
;;;;;;  "cider-macroexpansion.el" "cider-pkg.el" "cider-repl-mode.el"
;;;;;;  "cider-repl.el" "cider-selector.el" "cider-version.el") (21089
;;;;;;  18451 414525 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; cider-autoloads.el ends here
