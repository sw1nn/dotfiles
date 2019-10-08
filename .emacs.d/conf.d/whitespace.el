(setq whitespace-style
      '(face trailing lines-tail newline empty space-after-tab
             space-after-tab::tab space-after-tab::space space-before-tab
             space-before-tab::tab space-before-tab::space help-newline))

(setq whitespace-global-modes '(not snippet-mode makefile-mode))

(global-whitespace-mode)

(add-hook 'snippet-mode-hook
          (lambda nil
            (setq-local whitespace-style
                        '(face newline big-indent space-after-tab
                               space-after-tab::tab space-after-tab::space
                               space-before-tab space-before-tab::tab
                               space-before-tab::space help-newline space-mark
                               newline-mark tab-mark))
            (setq-local delete-trailing-lines nil)
            (whitespace-mode t)))

(add-hook 'makefile-mode-hook
          (lambda nil
            (setq-local whitespace-style
                        (append whitespace-style '(tabs tab-mark)))
            (whitespace-mode t)))

(add-hook 'before-save-hook
          (lambda nil
            (unless (derived-mode-p 'snippet-mode)
              (unless (or (derived-mode-p 'makefile-mode)
                          (derived-mode-p 'ein:notebook-multilang-mode)
                          (string= (file-name-extension (buffer-file-name))
                                   "tsv"))
                (untabify (point-min) (point-max)))
              (whitespace-cleanup))))
