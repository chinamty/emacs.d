;;; init-lspBridge.el --- settings for lsp mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-to-list 'load-path "~/.emacs.d/packages/lsp-bridge/")


(require 'lsp-bridge)
(require 'lsp-bridge-jdtls)

(global-lsp-bridge-mode)

;; 融合 `lsp-bridge' `find-function' 以及 `dumb-jump' 的智能跳转
(defun lsp-bridge-jump ()
  (interactive)
  (cond
   ((eq major-mode 'emacs-lisp-mode)
    (let ((symb (function-called-at-point)))
      (when symb
        (find-function symb))))
   (lsp-bridge-mode
    (lsp-bridge-find-def))
   (t
    (require 'dumb-jump)
    (dumb-jump-go))))

(defun lsp-bridge-jump-back ()
  (interactive)
  (cond
   (lsp-bridge-mode
    (lsp-bridge-return-from-def))
   (t
    (require 'dumb-jump)
    (dumb-jump-back))))


(global-set-key (kbd "C-c j") 'lsp-bridge-jump)
(global-set-key (kbd "C-c b") 'lsp-bridge-jump-back)
;; 打开日志，开发者才需要
(setq lsp-bridge-enable-log t)

(provide 'init-lspbridge)
;;; init-lspbridge.el ends here

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
