(use-package all-the-icons-dired
  :quelpa (all-the-icons-dired :fetcher url
			       :url "https://raw.githubusercontent.com/jtbm37/all-the-icons-dired/master/all-the-icons-dired.el")
  :init (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))
