;; Suppress GUI features

(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message nil)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; display not only current line but also a column
(column-number-mode 1)
;; display line numbers
(require 'linum)
(setq linum-format "%4d")
;(global-linum-mode 0)
(global-linum-mode 1)

;; "y", "n" instead of "yes", "no"
(fset 'yes-or-no-p 'y-or-n-p)  

(provide 'init-gui-frames)
