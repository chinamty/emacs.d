;;; package --- init-flycheck -*- lexibinding -*-
;;; commentary:
;;; code:


(use-package flycheck
  :hook (after-init . global-flycheck-mode)
  :config
  (setq flycheck-emacs-lisp-load-path 'inherit)

  ;; And don't recheck on idle as often
  (setq flycheck-idle-change-delay 1.0)

  ;; For the above functionality, check syntax in a buffer that you switched to
  ;; only briefly. This allows "refreshing" the syntax check state for several
  ;; buffers quickly after e.g. changing a config file.
  (setq flycheck-buffer-switch-check-intermediate-buffers t)

  ;; Display errors a little quicker (default is 0.9s)
  (setq flycheck-display-errors-delay 0.25)

  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list
        flycheck-check-syntax-automatically '(idle-change mode-enabled)))

(use-package flycheck-color-mode-line
  :hook (flycheck-mode . flycheck-color-mode-line-mode)
  :after flycheck)


;; (use-package flymake
;;   :hook (prog-mode . flymake-mode)
;;   :config
;;   (global-set-key (kbd "M-n") #'flymake-goto-next-error)
;;   (global-set-key (kbd "M-p") #'flymake-goto-prev-error))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
