(use-package all-the-icons-dired
  :hook ((dired-mode . all-the-icons-dired-mode)
	 (dired-mode . auto-revert-mode))

  :quelpa (all-the-icons-dired :fetcher url
			       :url "https://raw.githubusercontent.com/jtbm37/all-the-icons-dired/master/all-the-icons-dired.el"))
