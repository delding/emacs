;; Some basic preferences
(setq-default
 blink-cursor-delay 0
 blink-cursor-interval 0.4
 bookmark-default-file (expand-file-name ".bookmarks.el" user-emacs-directory)
 buffers-menu-max-size 30
 case-fold-search t
 compilation-scroll-output t
 delete-selection-mode t
 grep-highlight-matches t
 grep-scroll-output t
 indent-tabs-mode nil
 line-spacing 0.2
 make-backup-files nil
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 set-mark-command-repeat-pop t
 show-trailing-whitespace t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil)

(transient-mark-mode t)

;; Cut/copy the current line if no region is activeK
(require 'whole-line-or-region)
(whole-line-or-region-mode t)
(make-variable-buffer-local 'whole-line-or-region-mode)
(diminish 'whole-line-or-region-mode)

(require 'whitespace-cleanup-mode)
(global-whitespace-cleanup-mode t)

(require 'undo-tree)
(global-undo-tree-mode)
(diminish 'undo-tree-mode)

;; Show matching parens
(show-paren-mode 1)

;; smart tab behavior - indent or complete
; (setq tab-always-indent 'complete)

;; highlight the current line
(global-hl-line-mode +1)
(require 'volatile-highlights)
(volatile-highlights-mode t)
(diminish 'volatile-highlights-mode)

;; enable narrowing commands
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

(require 'highlight-escape-sequences)
(hes-mode)

;; ediff is a visual interface to diff
(require 'ediff)
(setq ediff-split-window-function 'split-window-horizontally)
;; don't start another frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; highlight uncommitted changes
(require 'diff-hl)
(global-diff-hl-mode +1)
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)

;; avy is a modern acejump
(require 'avy)
(setq avy-background t)
(setq avy-style 'at-full)

;; anzu-mode enhances isearch & query-replace by showing total matches and current match position
(require 'anzu)
(diminish 'anzu-mode)
(global-anzu-mode)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

(global-set-key (kbd "M-/") 'hippie-expand)
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

(provide 'init-editor)
