;; patch in https://github.com/abo-abo/swiper/commit/0f4cb44c5723564220d6faa8b6977f5a2044fd77
;; needed to make lsp-ivy-workspace-symbol work
(defun sw1nn/ivy-add-prompt-count (prompt)
  "Add count information to PROMPT."
  (cond ((null ivy-count-format)
	 (error
	  "`ivy-count-format' can't be nil.  Set it to \"\" instead"))
	((string-match "%d.*\\(%d\\)" ivy-count-format)
	 (let* ((w
		 (if (listp ivy--all-candidates)
		     (1+ (floor (log (max 1 (length ivy--all-candidates)) 10)))
		   1))
		(s (replace-match (format "%%-%dd" w) t t ivy-count-format 1)))
	   (string-match "%d" s)
	   (concat (replace-match (format "%%%dd" w) t t s)
		   prompt)))
	((string-match-p "%.*d" ivy-count-format)
	 (concat ivy-count-format prompt))
	(ivy--directory
	 prompt)
	(t
	 prompt)))

(defun sw1nn/patch-ivy-13 ()
  (when (version-list-= (pkg-info-package-version "ivy") '(0 13 0))
    (eval-after-load 'ivy
      (progn (message "sw1nn: Patching ivy-13.0...")
	     (advice-add 'ivy-add-prompt-count :override #'sw1nn/ivy-add-prompt-count)))))

(use-package ivy
  :init (ivy-mode 1)
  :bind (([remap isearch-forward] . swiper)
	 ([remap isearch-backward] . swiper-backward)
	 ("C-c C-r" . ivy-resume))
  :config
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) ")
  (sw1nn/patch-ivy-13)
  :diminish ivy-mode)

(use-package counsel
  :init (counsel-mode))

(use-package all-the-icons-ivy
  :init (all-the-icons-ivy-setup))
