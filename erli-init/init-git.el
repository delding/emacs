(require 'magit)

(setq-default
 magit-save-some-buffers nil
 magit-process-popup-time 10
 magit-diff-refine-hunk t
 magit-completing-read-function 'magit-ido-completing-read)

;; Hint: customize `magit-repo-dirs' so that you can use C-u M-F12 to
;; quickly open magit on any one of your projects.
(global-set-key [(meta f12)] 'magit-status)

;; Setup magit-status to open in one window in the current frame
(require 'fullframe)
(fullframe magit-status magit-mode-quit-window nil)

;; github
(require 'github-browse-file)

(provide 'init-git)
