;;; init-lspBridge.el --- settings for lsp mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; install all-the-icons

(add-to-list 'load-path "~/.emacs.d/packages/lsp-bridge/")
(use-package all-the-icons
  :if (display-graphic-p))


(use-package posframe
  :config
  (defvar my-posframe-buffer " *my-posframe-buffer*")

(with-current-buffer (get-buffer-create my-posframe-buffer)
  (erase-buffer))
  

(when (posframe-workable-p)
  (posframe-show my-posframe-buffer
                 :position (point))))

(require 'lsp-bridge)
;;(require 'lsp-bridge-orderless)
;;(require 'lsp-bridge-icon)

(global-lsp-bridge-mode)
(provide 'init-lspbridge)
;;; init-lspbridge.el ends here

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
