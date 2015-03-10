;; displays current match and total matches information in the mode-line in various search mode

(global-anzu-mode t)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)
;; remove anzu minor mode indicators, require diminish.el
(diminish 'anzu-mode)

(provide 'init-anzu)
