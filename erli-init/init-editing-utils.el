;; “cut” and “copy” act on the current line if no text is visually selected
(require 'whole-line-or-region)

;; insert an opening delimiter, the matching closing delimiter is automatically inserted as well, leaving point between the two
(setq-default electric-pair-mode 1)

;; Some basic preferences
(setq-default
 blink-cursor-delay 0
 blink-cursor-interval 0.4
 bookmark-default-file (expand-file-name ".bookmarks.el" user-emacs-directory)
 buffers-menu-max-size 30
 case-fold-search t
 column-number-mode t
 compilation-scroll-output t
 delete-selection-mode t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 grep-highlight-matches t
 grep-scroll-output t
 indent-tabs-mode nil
 line-spacing 0.2
 make-backup-files nil
 mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 set-mark-command-repeat-pop t
 show-trailing-whitespace t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil
 visible-bell t)
 
(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

(transient-mark-mode t)

(require 'whitespace-cleanup-mode)
(global-whitespace-cleanup-mode t)

;; Newline behaviour
;; S-return let you go to the end of line and return
(global-set-key (kbd "RET") 'newline-and-indent)
(defun sanityinc/newline-at-end-of-line ()
  "Move to end of line, enter a newline, and reindent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))
(global-set-key (kbd "<S-return>") 'sanityinc/newline-at-end-of-line)

(require 'undo-tree)
(global-undo-tree-mode)
(diminish 'undo-tree-mode)

;; don't disable narrowing commands
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

;; Show matching parens
(show-paren-mode 1)

;; expand region increases the selected region by semantic units
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; Don't disable case-change functions
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Rectangle selections, and overwrite text when the selection is active
(cua-selection-mode t)                  ; for rectangles, CUA is nice

;; C-c j join-line, join the current to the end of previous line
;; Vimmy alternatives to M-^
(global-set-key (kbd "C-c j") 'join-line)

;; C-<SPC> C-<SPC> set the mark, pushing it onto the mark ring, without activating it
;; C-u C-<SPC> move point to where the mark was, and restore the mark from the ring of former marks
;; C-x C-<SPC> (pop-global-mark) jumps to the buffer and position of the latest entry in the global ring

;; Kill back to indentation C-M-backspace
(defun kill-back-to-indentation ()
  "Kill from point back to the first non-whitespace character on the line."
  (interactive)
  (let ((prev-pos (point)))
    (back-to-indentation)
    (kill-region (point) prev-pos)))
(global-set-key (kbd "C-M-<backspace>") 'kill-back-to-indentation)

(require 'ace-jump-mode)
(global-set-key (kbd "C-;") 'ace-jump-mode)
(global-set-key (kbd "C-:") 'ace-jump-word-mode)

;; Cut/copy the current line if no region is active
(whole-line-or-region-mode t)
(diminish 'whole-line-or-region-mode)
(make-variable-buffer-local 'whole-line-or-region-mode)

(require 'highlight-escape-sequences)
(hes-mode)

(provide 'init-editing-utils)
