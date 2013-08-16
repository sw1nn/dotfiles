This is a Git-powered replacement for something like TextMate's
Cmd-t.

Uses a configurable completing-read to open any file in the

Git repository of the current buffer.

Usage:

    (require 'magit-find-file) ;; if not using the ELPA package
    (global-set-key (kbd "C-c p") 'magit-find-file-completing-read)

Customize 'magit-completing-read-function to change the completing
read engine used (so it should behave like Magit does for you).

Customize 'magit-find-file-skip-images to include images in your
candidate list. This is t by default.
