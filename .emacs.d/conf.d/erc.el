;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ERC Config

;; Load authentication info from an external source.
(let ((auth-file "~/.emacs.d/.erc-auth"))
  (when (file-exists-p auth-file)
    (load auth-file)
    (require 'erc-services)
    (setq erc-email-user-id freenode-email-user-id)
    (setq erc-nickserv-passwords
          `((freenode (("sw1nn" . ,freenode-nickone-pass)))))))     

(require 'erc-highlight-nicknames)

;;; Finally, connect to the networks.
(defun irc-maybe ()
  (interactive)
  (when (y-or-n-p "IRC? ")
    (erc-ssl :server "irc.freenode.net" :port 6697 :nick "sw1nn" :full-name "Neale Swinnerton")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
