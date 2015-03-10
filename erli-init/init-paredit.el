;;C-M-n     forward-list  Move forward over a parenthetical group 
;;C-M-p     backward-list  Move backward over a parenthetical group 
;;C-M-f     forward-sexp Move forward over a balanced expression
;;C-M-b     backward-sexp  Move backward over a balanced expression
;;C-M-k     kill-sexp  Kill balanced expression forward
;;C-M-SPC   mark-sexp  Put the mark at the end of the sexp

(require 'paredit)
(autoload 'enable-paredit-mode "paredit")

(defun maybe-map-paredit-newline ()
  (unless (or (memq major-mode '(inferior-emacs-lisp-mode cider-repl-mode))
              (minibufferp))
    (local-set-key (kbd "RET") 'paredit-newline)))

(add-hook 'paredit-mode-hook 'maybe-map-paredit-newline)

;; Disable kill-sentence, which is easily confused with the kill-sexp
;; binding, but doesn't preserve sexp structure
;(define-key paredit-mode-map [remap kill-sentence] nil)
;(define-key paredit-mode-map [remap backward-kill-sentence] nil)

;; Use paredit in the minibuffer
;; TODO: break out into separate package
;; http://emacsredux.com/blog/2013/04/18/evaluate-emacs-lisp-in-the-minibuffer/
(add-hook 'minibuffer-setup-hook 'conditionally-enable-paredit-mode)

(defvar paredit-minibuffer-commands '(eval-expression
                                      pp-eval-expression
                                      eval-expression-with-eldoc
                                      ibuffer-do-eval
                                      ibuffer-do-view-and-eval)
  "Interactive commands for which paredit should be enabled in the minibuffer.")

(defun conditionally-enable-paredit-mode ()
  "Enable paredit during lisp-related minibuffer commands."
  (if (memq this-command paredit-minibuffer-commands)
      (enable-paredit-mode)))

;; Enable some handy paredit functions in all prog modes
(require 'paredit-everywhere)
(add-hook 'prog-mode-hook 'paredit-everywhere-mode)

(diminish 'paredit-mode " Par")

(provide 'init-paredit)
