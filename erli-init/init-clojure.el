(require 'clojure-mode-extra-font-locking)
(require 'cider)
(require 'ac-cider)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'clojure-mode-hook 'smartparens-strict-mode)

(provide 'init-clojure)
