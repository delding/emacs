;; Manual - http://cx4a.org/software/auto-complete/manual.html

(require 'auto-complete-config)
(global-auto-complete-mode t)

;; not to expand a common part of whole candidates
(setq-default ac-expand-on-auto-complete nil)

;; don't start auto completion automaticly
(setq-default ac-auto-start nil)

;; do what i mean, set nil to get pop-ups with docs even if a word is uniquely completed
(setq-default ac-dwim nil)

;; set ac trigger key
(ac-set-trigger-key "TAB")

;; set ac-dict as an additional dictionary for auto-complelet, same as snippets for yasnippet
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

(setq-default ac-sources
              '(ac-source-yasnippet
                ac-source-imenu  ;; M-x imenu, for a source-code buffer imenu is typical to index definitions of functions, variables, etc..
				ac-source-dictionary  ;; auto-complete dictionary
				;ac-source-gtags
				;ac-source-eclim
				ac-source-semantic
				ac-source-semantic-raw
				ac-source-words-in-buffer
				ac-source-words-in-same-mode-buffers
                ))
             
                
;;----------------------------------------------------------------------------
;; Use Emacs' built-in TAB completion hooks to trigger AC
;;----------------------------------------------------------------------------
(setq tab-always-indent 'complete)  ;; use 't when auto-complete is disabled
(add-to-list 'completion-styles 'initials t)
;; Stop completion-at-point from popping up completion buffers so eagerly
(setq completion-cycle-threshold 5)

;; TODO: find solution for php, haskell and other modes where TAB always does something

(setq c-tab-always-indent nil
      c-insert-tab-function 'indent-for-tab-command)

;; hook AC into completion-at-point
(defun sanityinc/auto-complete-at-point ()
  (when (and (not (minibufferp))
	     (fboundp 'auto-complete-mode)
	     auto-complete-mode)
    (auto-complete)))

(defun sanityinc/never-indent ()
  (set (make-local-variable 'indent-line-function) (lambda () 'noindent)))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions
        (cons 'sanityinc/auto-complete-at-point
              (remove 'sanityinc/auto-complete-at-point completion-at-point-functions))))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)


(provide 'init-auto-complete)


