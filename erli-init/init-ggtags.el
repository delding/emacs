;; cscopes and gnu-global share a similar set of functions
;; xcscopes.el is an interface to csopes while ggtags.el is an interface to gnu-global
;; gtags.el is gnu-global's built in interface for emacs
;; xcscopes can also be set as gnu global's front-end

;; can set variable ggtags-executable-directory to indicate the path of executable gtags instead of exporting the path to PATH 
(custom-set-variables
  '(ggtags-executable-directory "/usr/local/src/gnu-global/bin"))

;; use M-. (ggtags-find-tag-dwim) to find the tag at point
;; M-* will take you to the previous place where you pressed M-.
;; if the project has not been indexed (i.e. no GTAGS file exists)
;; invoke ggtags-create-tags to index recursively from project root directory

;; Set xcscope as the front-end of GNU Global
;;(setq cscope-program “gtags-cscope”)

;; set ggtags as front end of gnu-global for c++ and java
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))
;(add-hook 'c-mode-common-hook
;  '(lambda ()
;     (gtags-mode 1)))

(provide 'init-ggtags)
