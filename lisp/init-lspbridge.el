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





;; (define-derived-mode genehack-vue-mode web-mode "ghVue"
;;     "A major mode derived from web-mode, for editing .vue files with LSP support.")

;; (defun my-eglot-keybindgs ()
;;   (define-key evil-motion-state-map "gR" #'eglot-rename)
;;   (define-key evil-motion-state-map "gr" #'xref-find-references)
;;   (define-key evil-normal-state-map "gi" #'eglot-find-implementation)
;;   (define-key evil-motion-state-map "gh" #'eldoc)
;;   (define-key evil-normal-state-map "ga" #'eglot-code-actions))

;; (use-package eglot
;;   :ensure t
;;   :init
;;   (add-to-list 'auto-mode-alist '("\\.vue\\'" . genehack-vue-mode))
;;   (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
;;   (advice-add 'eglot-ensure :after 'my-eglot-keybindgs)
;;   :bind (:map eglot-mode-map
;;               ("C-c l a" . eglot-code-actions)
;;               ("C-c l r" . eglot-rename)
;;               ("C-c l o" . eglot-code-action-organize-imports)
;;               ("C-c l f" . eglot-format)
;;               ("C-c l d" . eldoc)
;;               ("s-<return>" . eglot-code-actions))
;;   :hook
;;   ;; (css-mode . eglot-ensure)
;;   ;; (js2-mode . eglot-ensure)
;;   ;; (js-mode . eglot-ensure)
;;   ;; (web-mode . eglot-ensure)
;;   ;; (genehack-vue-mode . eglot-ensure)
;;   (rust-mode . eglot-ensure)
;;   :config
;;   (setq eglot-send-changes-idle-time 0.2)
;;   (add-to-list 'eglot-server-programs '(genehack-vue-mode "vls"))
;;   (add-to-list 'eglot-server-programs '(rust-modne "rust-analyzer"))
;;   (add-to-list 'eglot-server-programs '(web-mode . ("vscode-html-language-server" "--stdio")))

;;   (setq read-process-output-max (* 1024 1024))
;;   (push :documentHighlightProvider eglot-ignored-server-capabilities)
;;   (setq eldoc-echo-area-use-multiline-p nil))
;;; Require
(require 'lsp-bridge)
(require 'lsp-bridge-jdtls)
(setq lsp-bridge-enable-auto-format-code t)
;;; Code:

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

;; 打开日志，开发者才需要
(setq lsp-bridge-enable-log t)

(provide 'init-lspbridge)
;;; init-lspbridge.el ends here

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
