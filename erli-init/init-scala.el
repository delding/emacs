;; to use add the following lines to project/plugins.sbt file, or ~/.sbt/0.13/plugins/plugins.sbt file
;; addSbtPlugin("org.ensime" % "ensime-sbt-cmd" % "VERSION")
;; VERSION is the version of ensime-sbt-cmd on your computer
;; execute sbt "ensime generate" in your project root dir, the command will write a .ensime file to your project's root directory
;; in scala mode use command ensime to connect .ensime file and then ensime-mode can be used with scala-mode in emacs 

(require 'scala-mode2)
(require 'ensime)
(require 'sbt-mode)

;; append scala path to exec-path so that flycheck can find scala as syntax checker
(setq exec-path (append exec-path '("/usr/local/src/scala-2.10.4/bin")))

;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(provide 'init-scala)
