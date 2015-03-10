;; need to install package emacs-eclim.el first
(require 'eclim)
(global-eclim-mode)
(require 'eclimd)

(custom-set-variables
  '(eclim-eclipse-dirs '("/usr/local/src/eclipse-kepler"))
  '(eclim-executable "/usr/local/src/eclipse-kepler/eclim"))

(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

;; not using eclim as a source of auto-complete
;; if use eclim as a source but don't start eclimd daemon, auto-complete will be disabled because of refused connection
;(require 'ac-emacs-eclim-source)
;(ac-emacs-eclim-config)

;; eclimd-executable set to nil indicates eclimd located in the same directory as eclim
;; eclimd-wait-for-process set to nil makes start-eclimd command not pause emacs before eclimd daemon is ready to accept commands
;; eclimd startup takes several seconds, so emacs-eclim commands will fail until eclimd daemon is ready
;; use stop-eclimd command to stop eclimd daemon
(setq eclim-auto-save t
      eclimd-executable nil
      eclimd-wait-for-process nil
      eclimd-default-workspace "~/Projects"
      )

(provide 'init-eclim)
