;; Lisp expressions , or forms, are evaluated automatically upon their
;; occurrence in a program being run.
;; expression (quote object), or 'object, is evaluated as object
;; object, if a non-self-evaluating expression e.g. a symbol expression,
;; is evaluated as the value in its simbol cell

;; var user-emacs-directory holds the value "~/.emacs.d/"
;; fun expand-file-name returns the absulote file name "~/.emacs.d/erli-init/"
;; the value of variable load-path can be checked in emacs
;; the path that is added last will be searched first
;; the path of package that is installed by package.el, e.g. packages in
;; the elpa directory, will be automatically added to 'load-path

(add-to-list 'load-path (expand-file-name "erli-init" user-emacs-directory))

(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

(require 'init-elpa)
(require 'init-themes)
(require 'init-gui-frames)
(require 'init-windows)
(require 'init-sessions)
(require 'init-ibuffer)
(require 'init-dired)
(require 'init-anzu)
(require 'init-uniquify)
(require 'init-ido)

(require 'init-flycheck)
(require 'init-hippie-expand)
(require 'init-auto-complete)
(require 'init-yasnippet)
(require 'init-ggtags)
(require 'init-paredit)
(require 'init-editing-utils)

(require 'init-vc)
(require 'init-git)

(require 'init-org)
(require 'init-nxml)
(require 'init-html)
(require 'init-python)
(require 'init-cpp)
(require 'init-makefile)
(require 'init-scala)
(require 'init-javascript)
(require 'init-css)
(require 'init-php)
(require 'init-markdown)
(require 'init-clojure)

;(require 'init-java-malabar)
;(require 'init-eclim)
;(require 'init-java)

(require 'init-server)

(provide 'init)
