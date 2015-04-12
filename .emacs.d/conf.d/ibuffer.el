(use-package ibuffer-git
  :pin melpa
  :ensure t
  :config
  (setq ibuffer-formats '((mark modified read-only git-status-mini " "
				(name 40 40 :left :elide)
				" "
				(size 9 -1 :right)
				" "
				(mode 16 16 :left :elide)
				" "
				(vc-status 16 16 :left :elide)
				" "
				filename-and-process))
	     ibuffer-show-empty-filter-groups nil)
  :init
  (add-hook 'ibuffer-hook
	    (lambda nil
	      (ibuffer-auto-mode 1)
	      (ibuffer-vc-set-filter-groups-by-vc-root)
	      (unless (eq ibuffer-sorting-mode 'alphabetic)
		(ibuffer-do-sort-by-alphabetic)))))
