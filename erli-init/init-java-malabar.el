(require 'malabar-mode)

(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                  global-semanticdb-minor-mode
                                  global-semantic-idle-summary-mode
                                  global-semantic-mru-bookmark-mode))
(semantic-mode 1)
;;(setq malabar-groovy-lib-dir "/path/to/malabar/lib")
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))


(provide 'init-java-malabar)