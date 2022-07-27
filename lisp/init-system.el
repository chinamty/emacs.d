;;; pacakage --- init-system.el --configs for startup
;; -*- lexical-binding: t -*-
;;; commentary:

;;; code:
;;; macOS special settings
;; <macOS> Command -> Meta, Option -> Super
(when (eq system-type 'darwin)

  (setq mac-command-modifier 'meta
	    mac-option-modifier 'super
	    ns-use-native-fullscreen t))

(when (>= emacs-major-version 29)
  (pixel-scroll-precision-mode t))


;;; emacs settinngs
(setq auto-save-default nil	   ; disable auto save
      make-backup-files nil             ; disable backup file
      create-lockfiles nil
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
(setq-default indent-tabs-mode nil
              cursor-type 'bar)
(global-auto-revert-mode t)
(global-linum-mode t)
(global-hl-line-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(delete-selection-mode 1)

;; set font
(set-face-attribute 'default nil :font "SF Mono" :height 190)

(use-package solarized-theme
              :init (load-theme 'solarized-dark t))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
;; 设置默认窗口位置大小
;; 全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;; half screen
;;(setq initial-frame-alist '((top . 0) (left . 200)   (width . 80) (height . 100)))

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



;; Settings for exec-path-from-shell
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :config
  (exec-path-from-shell-initialize))


(use-package all-the-icons
  :if (display-graphic-p))

(use-package posframe)
;; popwin
(use-package popwin
  :hook (after-init . popwin-mode))


(add-to-list 'load-path "~/.emacs.d/packages/auto-save")
(require 'auto-save)
(auto-save-enable)
(setq auto-save-silent t)
(setq auto-save-delete-trailing-whitespace t)

;; 自动cover被外部修改的文件
(use-package autorevert
  :ensure nil
  :hook (after-init . global-auto-revert-mode))

;; recentf

(use-package recentf
  :hook (after-init . recentf-mode)
  :config
  (setq-default recentf-max-menu-item 10
		        recentf-max-saved-items 100)
  (add-to-list 'recentf-exclude '("~\/.emacs.d\/elpa\/")))


(provide 'init-system)

;;; init-system.el ends here
