;; 	-*- lexical-binding: t -*-

;; 关闭工具栏
(tool-bar-mode -1)
;; 关闭文件滑动控制
(scroll-bar-mode -1)
;; 显示行号
(global-linum-mode 1)

;; 更改光标样式
(setq-default cursor-type 'bar)

;; 更改显示字体大小 16pt
(set-face-attribute 'default nil :height 180)
;; 直接替换选中文字
(delete-selection-mode 1)
;; 高亮当前行
(global-hl-line-mode 1)



;; 设置默认窗口位置大小
;; 全屏
;;(setq initial-frame-alist (quote ((fullscreen . maximized))))
(setq initial-frame-alist '((top . 0) (left . 200)   (width . 80) (height . 100)))


(provide 'init-ui)
