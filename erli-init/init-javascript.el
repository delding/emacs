(require 'json-mode)
(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'"    . js2-mode))
(add-to-list 'auto-mode-alist '("\\.pac\\'"   . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(eval-after-load 'js2-mode
  '(progn
     (defun prelude-js-mode-defaults ()
       (setq mode-name "JS2")
       (js2-imenu-extras-mode +1))

     (setq prelude-js-mode-hook 'prelude-js-mode-defaults)

     (add-hook 'js2-mode-hook (lambda () (run-hooks 'prelude-js-mode-hook)))))

(provide 'init-javascript)
