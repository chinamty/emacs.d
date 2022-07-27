;;; package --- init-program -*- lexical-binding: t -*-
;;; Commentary:
;;; install some program mode do not use frequently
;;; code:

;; prog-mode
(use-package prog-mode
  :ensure nil
  :config (global-prettify-symbols-mode t))

;; json mode
(use-package json-mode)

;; lua mode
(use-package lua-mode)

(provide 'init-program)
;;; init-program.el ends here
