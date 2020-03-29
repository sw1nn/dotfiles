(use-package ibuffer-vc
  :pin melpa-stable
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
        ibuffer-show-empty-filter-groups nil)
  ;; (add-to-list 'ibuffer-never-show-predicates "^\\*")
  :init
  (add-hook 'ibuffer-hook
            (lambda nil
              (ibuffer-auto-mode 1)
              (ibuffer-vc-set-filter-groups-by-vc-root)
              (unless (eq ibuffer-sorting-mode 'alphabetic)
                (ibuffer-do-sort-by-alphabetic)))))

(use-package all-the-icons-ibuffer
  :ensure t
  :init (all-the-icons-ibuffer-mode 1))
