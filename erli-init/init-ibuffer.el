;; single window per frame execution of buffer exposing commands, if 3rd arg set to t, kill buffer when quit
(require 'fullframe)
(fullframe ibuffer ibuffer-quit t)





(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'init-ibuffer)
