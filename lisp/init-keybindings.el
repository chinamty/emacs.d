
;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)
;; 绑定open-init-file到f2
(global-set-key (kbd "<f2>") 'open-init-file)
;; 绑定打开最近文件快捷键
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; counsel 相关快捷键
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h C-f") 'counsel-describe-function)
(global-set-key (kbd "C-h C-v") 'counsel-describe-variable)


(provide 'init-keybindings)
