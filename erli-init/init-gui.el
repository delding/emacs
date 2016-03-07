(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(menu-bar-mode -1)

(require 'beacon)
(beacon-mode +1)

; (blink-cursor-mode -1)

(setq ring-bell-function 'ignore)

(scroll-bar-mode -1)

(setq use-file-dialog nil)
(setq use-dialog-box )

(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)

(setq initial-scratch-message nil)

(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; "y", "n" instead of "yes", "no"
(fset 'yes-or-no-p 'y-or-n-p)

;; load color theme
(load-theme 'solarized-dark t)

;; nicer naming of buffers for files with identical names
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator " • ")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

(provide 'init-gui)
