;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; w3m tweaks

(require 'w3m)

(defun w3m-browse-url-other-window (url &optional newwin)
  "If the url matches an entry in `cider-javadoc-local-paths'
open the url in w3m otherwise call `browse-url-xdg-open'"
  (if (find-if (lambda (path)
                 (string-match (concat "file:" path) url))
               cider-javadoc-local-paths)
      (let ((w3m-pop-up-windows t))
        (if (one-window-p) (split-window-horizontally))
        (other-window 1)
        (w3m-browse-url url newwin))
    (browse-url-default-browser url newwin)))

(setq browse-url-browser-function 'w3m-browse-url-other-window)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
