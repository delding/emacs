(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; enable code evaluation support for languages
(require 'ob-C)
(require 'ob-java)
(require 'ob-python)
(require 'ob-scala)

(provide 'init-org)
