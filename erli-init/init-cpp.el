;;Each line of text should be at most 80 characters long
(setq default-fill-column 80) 

(require 'cc-mode)

;; Use Google's C/C++ Style:
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; Treat files ending in .h as c++ files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;Recognize standard c++ header files with no file extension
(require 'cl)

(defun file-in-directory-list-p (file dirlist)
  "Returns true if the file specified is contained within one of
the directories in the list. The directories must also exist."
  (let ((dirs (mapcar 'expand-file-name dirlist))
        (filedir (expand-file-name (file-name-directory file))))
    (and
     (file-directory-p filedir)
     (member-if (lambda (x) ; Check directory prefix matches
                  (string-match (substring x 0 (min(length filedir) (length x))) filedir))
                dirs))))

(defun buffer-standard-include-p ()
  "Returns true if the current buffer is contained within one of
the directories in the INCLUDE environment variable."
  (and (getenv "INCLUDE")
       (file-in-directory-list-p buffer-file-name (split-string (getenv "INCLUDE") path-separator))))

(add-to-list 'magic-fallback-mode-alist '(buffer-standard-include-p . c++-mode))

(require 'cedet)
;; Activate semantic
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
;(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
;(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)
;(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
;(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
;(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
;(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(semantic-mode 1)

;; not using names completion
;(require 'semantic/ia)

;; load speedbar
(require 'sr-speedbar)

;; Activate ede mode
(global-ede-mode t)

;; add gcc headers to system include files
(require 'semantic/bovine/gcc)

;; Load ecb mode
(require 'ecb-autoloads)
(setq ecb-tip-of-the-day nil)

(provide 'init-cpp)

