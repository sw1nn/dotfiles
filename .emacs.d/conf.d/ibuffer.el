(use-package ibuffer-vc
  :hook ((ibuffer . ibuffer-auto-mode)
	 (ibuffer . ibuffer-vc-set-filter-groups-by-vc-root)
	 (ibuffer . ibuffer-do-sort-by-alphabetic)
	 (ibuffer . all-the-icons-ibuffer-mode))
  :config
  (setq ibuffer-formats '((mark modified read-only vc-status-mini " "
				(icon 2 2 :left :elide)
                                (name 40 40 :left :elide)
                                " "
                                (size 9 -1 :right)
                                " "
                                (mode 16 16 :left :elide)
                                " "
                                (vc-status 16 16 :left :elide)
                                " "
                                filename-and-process))
        ibuffer-show-empty-filter-groups nil))

(use-package all-the-icons-ibuffer)
