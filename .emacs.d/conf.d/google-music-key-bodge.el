(defun automator-workflow (name)
  (let ((cmd (concat "automator \"/Users/neale/Library/Services/" name ".workflow\"")))
    (when (shell-command cmd))))

(defun google-music-play-pause ()
  (interactive)
  (automator-workflow "GoogleMusic - PlayPause"))

(defun google-music-prev-song ()
  (interactive)
  (automator-workflow "GoogleMusic - PrevSong"))

(defun google-music-next-song ()
  (interactive)
  (automator-workflow "GoogleMusic - NextSong"))

(defalias 'music-play-pause 'google-music-play-pause)
(defalias 'music-next-song  'google-music-next-song)
(defalias 'music-prev-song  'google-music-prev-song)
