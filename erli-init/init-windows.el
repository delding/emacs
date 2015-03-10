;; Navigate window layouts with "C-c <left>" and "C-c <right>
;; switch to previous and next buffer "C-c <left>" and "C-c <right>
(winner-mode 1)

;; Make "C-x o" prompt for a target window when there are more than 2
;; need to install package switch-window.el
(require 'switch-window)
(setq switch-window-shortcut-style 'alphabet)
(global-set-key (kbd "C-x o") 'switch-window)

;; When splitting window, show (other-buffer) in the new window
(defun split-window-func-with-other-buffer (split-function)
  (lexical-let ((s-f split-function))
    (lambda ()
      (interactive)
      (funcall s-f)
      (set-window-buffer (next-window) (other-buffer)))))

(global-set-key "\C-x2" (split-window-func-with-other-buffer 'split-window-vertically))
(global-set-key "\C-x3" (split-window-func-with-other-buffer 'split-window-horizontally))

(provide 'init-windows)
