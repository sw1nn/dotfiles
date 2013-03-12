;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; pastebin

(let ((auth-file "~/.emacs.d/.pastebin-auth"))
  (when (file-exists-p auth-file)
    (require 'pastebin)
    (load auth-file)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

