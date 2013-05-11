(defun automator-workflow (name)
  (let ((cmd (concat "automator \"/Users/neale/Library/Services/" name ".workflow\"")))
    (when (shell-command cmd))))

(defun google-music-play-(point)ause ()
  (interactive)
  (automator-workflow "GoogleMusic - PlayPause"))

(defun google-music-prev-song ()
  (interactive)
  (automator-workflow "GoogleMusic - PrevSong"))

(defun google-music-next-song ()
  (interactive)
  (automator-workflow "GoogleMusic - NextSong"))

(define-key my-keys-minor-mode-map (kbd "<f7>") 'google-music-prev-song)
(define-key my-keys-minor-mode-map (kbd "<f8>") 'google-music-play-pause)
(define-key my-keys-minor-mode-map (kbd "<f9>") 'google-music-next-song)
