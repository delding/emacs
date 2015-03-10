;;; Solution for http://emacsredux.com/blog/2013/05/16/whitespace-cleanup/
(add-hook 'makefile-mode-hook 'indent-tabs-mode)

;;; My solution
;(setq-default 
;  tab-width 4 
;  whitespace-tab-width 4
;  whitespace-indent-tabs-mode nil)
;(make-variable-buffer-local 'whitespace-indent-tabs-mode)
;(setq whitespace-indent-tabs-mode indent-tabs-mode)

;; The problem is that indent-tabs-mode is buffer-local, 
;; but in whitespace.el it is set to a regular variable called 
;; whitespace-indent-tabs-mode whose value is not changed unless
;; you explicitly reset it. 
;; Manually set whitespace-indent-tabs-mode equal to indent-tabs-mode
;; find-file-hook
;; The value of this variable is a list of functions to be called after
;; a file is visited. The file's local-variables specification (if any) 
;; will have been processed before the hooks are run. 
;; The following works only when opening a new file
;(add-hook 'find-file-hook 
;	'(lambda () 
;		(setq whitespace-indent-tabs-mode indent-tabs-mode)))
    
(provide 'init-makefile)

               
