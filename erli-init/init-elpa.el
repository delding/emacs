;;; Standard package repositories

;; load package.el
(require 'package)

;; elpa repo has been built in since emacs 24

;; marmalade not included in repo list
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; org repository
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

;; melpa for most packages
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))

;; Fire up package.el
(package-initialize)


(provide 'init-elpa)
