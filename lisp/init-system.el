;;; pacakage --- init-system.el --configs for startup
;; -*- lexical-binding: t -*-
;;; commentary:

;;; code:
;;; Emacs 28 native compile
(when (and (>= emacs-major-version 28)
	       (fboundp 'native-comp-available-p)
	       (native-comp-available-p))
  (setq native-comp-async-report-warnings-errors nil)
  (setq package-native-compile t)
  (add-to-list 'native-comp-eln-load-path
	           (expand-file-name "eln-cache" user-emacs-directory)))

;;; system coding
;; although others may add many other settings here,

;;; emacs settinngs
(setq auto-save-default nil	   ; disable auto save
      make-backup-files nil             ; disable backup file
      global-auto-revert-mode +1
      auto-window-vscroll nil
      delete-by-moving-to-trash t  ; disable delete directly
      fast-but-imprecise-scrolling t
      frame-title-format "%b"
      help-window-select t
      inhibit-startup-screen t	   ; disable the startup screen splash
      inhibit-default-init t
      initial-scratch-message nil
      inhibit-compacting-font-caches t
      next-line-add-newlines nil
      visible-bell nil)
(setq-default indent-tabs-mode nil)

;;; macOS special settings
;; <macOS> Command -> Meta, Option -> Super
(when (eq system-type 'darwin)

  (setq mac-command-modifier 'meta
	    mac-option-modifier 'super
	    ns-use-native-fullscreen t))


;; 设置编码为utf-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; save customize setting in custom.el
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)


(provide 'init-system)

;;; init-system.el ends here
