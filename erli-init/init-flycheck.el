;; Use C-c ! n (flycheck-next-error) and C-c ! p (flycheck-previous-error) to navigate between error locations
;; Type C-c ! l (flycheck-list-errors) to pop up a list of all errors in your current buffer


;;; flycheck
(add-hook 'after-init-hook 'global-flycheck-mode)
;(add-hook 'after-init-hook #'global-flycheck-mode)


;; set path to run cpplint.py in emacs
(custom-set-variables
 '(flycheck-c/c++-googlelint-executable "/usr/local/bin/cpplint.py"))
(custom-set-variables
 '(flycheck-googlelint-verbose "3")
 '(flycheck-googlelint-filter "-whitespace,+whitespace/braces")
 '(flycheck-googlelint-root "project/src")
 '(flycheck-googlelint-linelength "120"))     

;;;;;;;;;; DISABLE THIS FEATURE BECAUSE OF LOAD ERROR
;; flycheck google c++ style
;(eval-after-load 'flycheck
;  '(progn
;     (require 'flycheck-google-cpplint)
;     ;; Add Google C++ Style checker.
;     ;; In default, syntax checked by Clang and Cppcheck.
;     (flycheck-add-next-checker 'c/c++-clang
;                                'c/c++-googlelint 'append)))
                                

;; Override default flycheck triggers                                
(setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
      flycheck-idle-change-delay 0.8)

(provide 'init-flycheck)
