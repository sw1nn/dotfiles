;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; refheap

(let ((auth-file "~/.emacs.d/.refheap-auth"))
  (when (file-exists-p auth-file)
    (require 'refheap)
    (load auth-file)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
