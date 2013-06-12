;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ERC Config

;; Load authentication info from an external source.
(let ((auth-file "~/.emacs.d/.erc-auth"))
  (when (file-exists-p auth-file)
    (load auth-file)
    (require 'erc-services)
    (setq erc-email-user-id freenode-email-user-id)
    (add-to-list 'erc-networks-alist '(nixhelp "z.je"))
    (setq erc-nickserv-passwords
          `((freenode (("sw1nn" . ,freenode-nickone-pass)))
            (nixhelp  (("qass" . ,nixhelp-nickone-pass)))))))

(require 'erc-match)
;(require 'erc-highlight-nicknames)

(setq erc-user-full-name "Neale Swinnerton"
      erc-nick "sw1nn"
      erc-away-nickname "sw1nn|away"
      erc-nick-uniquifier "`"
      erc-autojoin-channels-alist '(("freenode.net" "#clojure" "#cascalog" "#pallet"))
      erc-hide-list '("JOIN" "NICK" "PART" "QUIT")
      erc-track-exclude-types '("NICK" "PART" "QUIT" "333" "353")
      erc-modules '(autojoin button completion fill irccontrols
                             list match menu move-to-prompt netsplit
                             networks noncommands readonly ring
                             scrolltobottom services stamp track highlight-nicknames)
      erc-port 6667
      erc-prompt-for-nickserv-password nil
      erc-prompt-for-password nil
      erc-server-auto-reconnect t
      erc-server-reconnect-attempts 16
      erc-server-reconnect-timeout 30
      erc-scrolltobottom-mode t
      erc-insert-timestamp-function 'erc-insert-timestamp-left
      erc-timestamp-format "%H:%M "
      erc-timestamp-only-if-changed-flag nil
      erc-hide-timestamps nil)

(let ((erc-custom-file "~/.emacs.d/.erc-custom"))
  (when (file-exists-p erc-custom-file)
    (load-file erc-custom-file)))

;;; Finally, connect to the networks.
(defun irc-maybe ()
  (interactive)
  ;; (select-frame (make-frame '((name . "IRC Frame")
  ;;                             (minibuffer . t))))
  (when (y-or-n-p "Bitlbee? ")
    (erc :server "localhost" :port 6667 :nick "sw1nn" :password "foobarbaz" :full-name "Neale Swinnerton"))
  (when (y-or-n-p "Freenode? ")
    (erc-ssl :server "irc.freenode.net" :port 6697 :nick "sw1nn" :full-name "Neale Swinnerton"))
  (when (y-or-n-p "AA ISP? ")
    (erc :server "irc.z.je" :nick "qass")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
