;; Use C-f during file selection to switch to regular find-file
;; C-s/C-r switches to the next/previous match
(ido-mode t)
(ido-everywhere t)
(setq ido-create-new-buffer 'always)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length 0)
(setq ido-use-virtual-buffers t)
(ido-ubiquitous-mode t)

;; Use smex to handle M-x
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(global-set-key [remap execute-extended-command] 'smex)

;; Allow the same buffer to be open in different frames
(setq ido-default-buffer-method 'selected-window)

(provide 'init-ido)
