;; provides company completion wih C/C++ headers
(require 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)
;; to provide project local header source, use company-c-headers-path-user instead
(add-to-list 'company-c-headers-path-system "/usr/local/Cellar/gcc5/5.3.0/lib/gcc/5/gcc/x86_64-apple-darwin15.3.0/5.3.0/include")

;; flycheck google cpplint
(require 'flycheck-google-cpplint)
(custom-set-variables
 '(flycheck-c/c++-googlelint-executable "/usr/local/bin/cpplint"))
;; add google c++ style checker after cppcheck
(flycheck-add-next-checker 'c/c++-cppcheck '(warning . c/c++-googlelint))

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; Treat files ending in .h as c++ files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; smartparens configure for c++
(sp-with-modes '(c-mode c++-mode)
  (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")
                                            ("* ||\n[i]" "RET"))))

;; turn on semantic
(semantic-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semanticdb-minor-mode 1)

;; use projectile for project management
;; TODO: projectile configure

;; TODO: irony-mode

;; makefile, need to use tabs as indent
(defun cpp-makefile-mode-defaults ()
  (whitespace-toggle-options '(tabs))
  (setq indent-tabs-mode t ))
(setq cpp-makefile-mode-hook 'cpp-makefile-mode-defaults)
(add-hook 'makefile-mode-hook (lambda ()
                                (run-hooks 'cpp-makefile-mode-hook)))

(provide 'init-cpp)
