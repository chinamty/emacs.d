;; 	-*- lexical-binding: t -*-

;; 自动恢复git回滚
(global-auto-revert-mode t)

;; 缩写补全
(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("mm" "martin")
					    ))

;; 简写yes or no 指令
(fset 'yes-or-no-p 'y-or-n-p)


;; 禁止自动备份
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default make-backup-files nil)

;; 备份文件目录
(setq backup-directory-alist '(("." . "~/.autosave")))

;; global hungry delete
;;(global-hungry-delete-mode)

;; 全局符号补全
(smartparens-global-mode t)
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil) 

;; 自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	    (t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))



;; js2-mode

;; Dired Mode
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)
(put 'dired-find-alternate-file 'disabled nil)
;; 延迟加载
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(provide 'init-perfomance)
