;;  -*- lexical-binding: t -*-
;;
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |
;;

;;; code:

(require 'package)

(setq package-archives '(("gnu"   . "http://elpa.zilongshanren.com/gnu/")
                         ("nongnu" . "http://elpa.zilongshanren.com/nongnu/")
			 ("melpa" . "http://elpa.zilongshanren.com/melpa/")))




;; Initialize packages
(unless (bound-and-true-p package--initialized) ; To avoid warnings in 27
  (setq package-enable-at-startup nil)          ; To prevent initializing twice
  (package-initialize))
;;防止反复调用 package-refresh-contents 会影响加载速度
(when (not package-archive-contents)
  (package-refresh-contents))

(assq-delete-all 'org package--builtins)
(assq-delete-all 'org package--builtin-versions)

;; Setup `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Should set before loading `use-package'
(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-always-defer t)
  (setq use-package-expand-minimally t)
  (setq use-package-enable-imenu-support t))

(eval-when-compile
  (require 'use-package))

(defvar use-package-selected-packages '(use-package)
  "Packages pulled in by use-package.")

;; Auto update packages
;; this maybe useful, if you want to update all the packages with command, just like me
(use-package auto-package-update
  :init (setq auto-package-update-delete-old-versions t
	          auto-package-update-hide-results t))





(provide 'init-packages)

;;; init-packages.el ends here

