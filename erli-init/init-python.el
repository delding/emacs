;; Ipython setting from emacswiki
;(require 'python)
;(setq
; python-shell-interpreter "ipython"
; python-shell-interpreter-args ""
; python-shell-prompt-regexp "In \\[[0-9]+\\]: "
; python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
; python-shell-completion-setup-code
;   "from IPython.core.completerlib import module_completion"
; python-shell-completion-module-string-code
;   "';'.join(module_completion('''%s'''))\n"
; python-shell-completion-string-code
;   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
   
;; elpy configure, set backend to jedi instead of rope
(elpy-enable)
(setq elpy-rpc-backend "jedi")
;; enable ipython
(elpy-use-ipython)
;; the original key binding "C-;" for iedit-mode conflict with ace-jump
(define-key global-map (kbd "C-c o") 'iedit-mode)

;; after enable elpy, RET and <return> in ac-complete-mode-map will be set to nil
;; rebind them to 'ac-complete
(define-key ac-completing-map (kbd "RET") 'ac-complete)
(define-key ac-completing-map (kbd "<return>") 'ac-complete)

(provide 'init-python)
