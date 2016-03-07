;;; package --- bind-key
;;; Commentary:

;; If you want the keybinding to override all minor modes that may also bind the same key,
;; use the `bind-key*' form:
;; (bind-key* "<C-return>" 'other-window)

;; To bind multiple keys in a `bind-key*' way (to be sure that your bindings will not
;; be overridden by other modes), you may use `bind-keys*' macro:
;; (bind-keys*
;;   ("C-o" . other-window)
;;   ("C-M-n" . forward-page)
;;   ("C-M-p" . backward-page))

;; After Emacs loads, you can see a summary of all your personal keybindings
;; currently in effect with this command:
;; M-x describe-personal-keybindings

(require 'bind-key)

;; mac specific settings
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  (setq mac-option-modifier 'alt)
  ;(setq mac-option-modifier 'none)
  (setq default-input-method "MacOSX")
  )

;; remapping problematic keys
(keyboard-translate ?\C-i ?\H-i) ; map C-i to H-i instead of TAB
;(define-key key-translation-map (kbd "C-i") (kbd "H-i"))
(define-key key-translation-map (kbd "C-S-i") (kbd "H-S-i"))
(keyboard-translate ?\C-m ?\H-m) ; map C-m to H-m instead of RET
;(define-key key-translation-map (kbd "C-m") (kbd "H-m"))
(define-key key-translation-map (kbd "C-S-m") (kbd "H-S-m"))

(defun kill-back-to-indentation ()
  "Kill from point back to the first non-whitespace character on the line."
  (interactive)
  (let ((prev-pos (point)))
    (back-to-indentation)
    (kill-region (point) prev-pos)))

(defun smart-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.
If point is already there, move to the beginning of the line."
 (interactive "^p")
  (setq arg (or arg 1))
  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))
  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(defun open-previous-line (arg)
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (indent-according-to-mode))

(defun open-next-line (arg)
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (forward-line 1)
  (indent-according-to-mode))


(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))


(bind-keys*
  ("H-i" . previous-line)
  ("C-k" . next-line)
  ("C-l" . forward-char)
  ("C-j" . backward-char)
  ("M-l" . forward-word)
  ("M-j" . backward-word)

  ("M-i" . beginning-of-defun)
  ("M-k" . end-of-defun)

  ("M-L" . sp-forward-sexp)
  ("M-J" . sp-backward-sexp)
  ("M-K" . sp-down-sexp)
  ("M-I" . sp-backward-up-sexp)
  ;; ("A-l" . sp-forward-sexp)
  ;; ("A-j" . sp-backward-sexp)
  ;; ("A-k" . sp-down-sexp)
  ;; ("A-i" . sp-backward-up-sexp)

  ("C-M-i" . move-line-up)
  ("C-M-k" . move-line-down)

  ("C-<backspace>" . kill-back-to-indentation)
  ("C-S-<backspace>" . kill-whole-line)
  ("C-S-d" . kill-line) ; from current point to end

  ("M-D" . sp-kill-sexp)
  ("M-S-<backspace>" . sp-backward-kill-sexp)

  ("C-M-SPC" . mark-defun)

  ("<M-left>" . switch-to-prev-buffer)
  ("<M-right>" . switch-to-next-buffer)

  ("C-'" . recenter-top-bottom)
)

(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key [S-return] 'open-next-line)
(global-set-key [C-return] 'open-previous-line)

(global-set-key (kbd "M-\\") 'delete-horizontal-space) ;; M-\ delete horizontal space

(global-set-key [remap move-beginning-of-line] 'smart-move-beginning-of-line)

(global-set-key (kbd "C-c j") 'join-line)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(define-key global-map (kbd "C-c o") 'iedit-mode)

;; shift + arrow keys to switch between windows
(windmove-default-keybindings)

;; undo redo previous and next window configuraion "C-c <left>" and "C-c <right>
(winner-mode 1)

;; Changing font sizes
(require 'default-text-scale)
(global-set-key (kbd "C-M-=") 'default-text-scale-increase)
(global-set-key (kbd "C-M--") 'default-text-scale-decrease)

;; M-SPC just one space
;; C-SPC C-SPC place a mark in buffer, C-u C-SPC goes back to previous mark
;; C-x C-x switch back and forth between mark point and current point

(require 'expand-region)
(global-set-key [?\H-m] 'er/expand-region)
(global-set-key (kbd "H-S-m") 'er/contract-region)

(global-set-key (kbd "C-;") 'avy-goto-word-1)
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "M-g g") 'avy-goto-line)

(global-set-key (kbd "M-'") 'imenu-anywhere)

(require 'highlight-symbol)
(highlight-symbol-mode 1)
(setq highlight-symbol-idle-delay 0.2)
(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)

;; M-. jump to definition, M-, jump back

(provide 'init-keymaps)
