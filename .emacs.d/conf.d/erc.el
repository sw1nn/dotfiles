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


(setq erc-user-full-name "Neale Swinnerton"
      erc-nick "sw1nn"
      erc-autojoin-channels-alist '(("freenode.net" "#clojure"))
      erc-hide-list '("JOIN" "NICK" "PART" "QUIT")
      erc-track-exclude-types '("NICK" "PART" "QUIT" "333" "353")
      erc-modules '(autojoin button completion fill irccontrols 
			     list match menu move-to-prompt netsplit 
			     networks noncommands readonly ring 
			     scrolltobottom services stamp track highlight-nicknames)
      erc-port 6697
      erc-prompt-for-nickserv-password nil
      erc-prompt-for-password nil
      erc-scrolltobottom-mode t)

;;; Finally, connect to the networks.
(defun irc-maybe ()
  (interactive)
  (when (y-or-n-p "IRC? ")
    (erc-ssl :server "irc.freenode.net" :port 6697 :nick "sw1nn" :full-name "Neale Swinnerton")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
