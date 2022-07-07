;; 	-*- lexical-binding: t -*-


(use-package all-the-icons
  :if (display-graphic-p))


(use-package posframe
  :init
    (defface posframe-border
      `((t (:background ,(face-foreground 'shadow nil t))))
      "Face used by the `posframe' border."
      :group 'posframe)
    (defun my-set-posframe-faces ()
      "Set `posframe' faces."
      (custom-set-faces
       `(posframe-border ((t (:background ,(face-foreground 'shadow nil t)))))))
  :config
  (defvar my-posframe-buffer " *my-posframe-buffer*")

(with-current-buffer (get-buffer-create my-posframe-buffer)
  (erase-buffer))


(when (posframe-workable-p)
  (posframe-show my-posframe-buffer
                 :position (point))))



;; Display dividers between windows
(setq window-divider-default-places t
      window-divider-default-bottom-width 1
      window-divider-default-right-width 1)
(setq scroll-step 1
      scroll-margin 0
      scroll-conservatively 100000
      auto-window-vscroll nil
      scroll-preserve-screen-position t)

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
