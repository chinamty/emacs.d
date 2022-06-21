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
      create-lockfiles nil
      global-auto-revert-mode t
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
      visible-bell nil
      )

(global-hl-line-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
(set-face-attribute 'default nil :height 180)
(setq-default indent-tabs-mode nil
              cursor-type 'bar)
(delete-selection-mode 1)
(use-package solarized-theme
              :init (load-theme 'solarized-dark t))

;; 设置默认窗口位置大小
;; 全屏
;;(setq initial-frame-alist (quote ((fullscreen . maximized))))
(setq initial-frame-alist '((top . 0) (left . 200)   (width . 80) (height . 100)))

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

;; 备份文件目录
(setq backup-directory-alist '(("." . "~/.autosave")))

;; 简写yes or no 指令
(fset 'yes-or-no-p 'y-or-n-p)

;;(setq url-gateway-method 'socks)
;;(setq socks-server '("Default server" "127.0.0.1" 7890 5))
;; Configure network proxy
;; 全局符号补全
;;(electric-pair-mode 1)

;; 自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	    (t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))


;; Settings for exec-path-from-shell
(use-package exec-path-from-shell
  :defer nil
  :if (memq window-system '(mac ns x))
  :init (exec-path-from-shell-initialize))


(provide 'init-system)

;;; init-system.el ends here
