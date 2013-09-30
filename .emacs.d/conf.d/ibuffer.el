(require 'ibuffer-git)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ibuffer Config

;;nicely format the ibuffer and include git-status
(setq ibuffer-formats '((mark modified read-only git-status-mini " "
                              (name 40 40 :left :elide)
                              " "
                              (size 9 -1 :right)
                              " "
                              (git-status 8 8 :left :elide)
                              " "
                              (mode 16 16 :left :elide)
                              " " filename-and-process))
      ibuffer-show-empty-filter-groups nil)

(add-hook 'ibuffer-hook
          (lambda nil
            (ibuffer-auto-mode 1)
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))
