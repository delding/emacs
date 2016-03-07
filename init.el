;;; package --- init
;;; Commentary:
;; Lisp expressions, or forms, are evaluated automatically upon their occurrence in a program being run.
;; Expression (quote object), or 'object, is evaluated as object
;; Object, if a non-self-evaluating expression e.g. a symbol expression, is evaluated as the value in its symbol cell

;;; Code:
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq package-enable-at-startup nil)
(package-initialize)

;; reduce frequence of garbage collection, making it happen on each 50 MB
(setq gc-cons-threshold 50000000)

;; always load newest byte code
(setq load-prefer-newer t)

;; warn when opening files bigger than 100 MB
(setq large-file-warning-threshold 100000000)

; common lisp extension for emacs lisp
(require 'cl-lib)
;; access from emacsclient
(require 'server)
(unless (server-running-p)
  (server-start))

(add-to-list 'load-path (expand-file-name "erli-init" user-emacs-directory))
(require 'init-gui)
(require 'init-windows)
(require 'init-sessions)
(require 'init-ido)

(require 'init-editor)
(require 'init-programming)
(require 'init-cpp)
(require 'init-python)
(require 'init-javascript)
(require 'init-go)

(require 'init-org)
(require 'init-markdown)
;(require 'init-nxml)
;(require 'init-html)
;(require 'init-scala)
;(require 'init-css)
;(require 'init-php)
;(require 'init-clojure)

(require 'init-keymaps)

(provide 'init)
