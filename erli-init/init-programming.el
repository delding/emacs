(custom-set-variables '(exec-path (append exec-path '("/usr/local/bin"))))

;; show the name of the current function definition in the modeline
(which-function-mode 1)

(require 'yasnippet)
(yas-global-mode 1)

(require 'company)
(setq company-idle-delay 0.5)
(setq company-tooltip-limit 9)
(setq company-minimum-prefix-length 2)
;; invert the navigation direction if the the completion popup-isearch-match
;; is displayed on top (happens near the bottom of windows)
;(setq company-tooltip-flip-when-above t)
(global-company-mode 1)

;; smartparens mode is a super set of both pairedit and electric pair
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)
(add-hook 'prog-mode-hook 'smartparens-mode)

(require 'flycheck)
(global-flycheck-mode)

;; projectile project management mode
(require 'projectile)
(setq projectile-cache-file (expand-file-name ".projectile.cache" user-emacs-directory))
(projectile-global-mode t)

(require 'magit)

(provide 'init-programming)
