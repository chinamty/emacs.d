;;; init.el
;; Martin emacs basic setting


;;; code:
(add-to-list 'load-path "~/.emacs.d/lisp/")
;; basic
;; fucs
;; package
;; complete
;; tool
;; ui
;;  org

(require 'init-packages)
(require 'init-system)
;;(require 'init-ui)
(require 'init-smartpair)
(require 'init-utils)
(require 'init-project)
(require 'init-flycheck)
(require 'init-consult)
(require 'init-corfu)
(require 'init-yasnippet)
;; ;;(require 'init-lsp)
(require 'init-markdown)
(require 'init-lspbridge)
;; ;;(require 'init-eglot)

(require 'init-org)

(require 'init-go)
(require 'init-python)
(require 'init-treemacs)
(require 'init-rust)
;; ;;(require 'init-eaf)
(require 'init-treesitter)
(require 'thing-edit)
(require 'init-smartpair)

;;; init.el ends here
(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yasnippet-snippets which-key vertico use-package treemacs-projectile treemacs-persp treemacs-magit solarized-theme smartparens rust-mode protobuf-mode popwin org-modern org-contrib orderless nov multiple-cursors marginalia live-py-mode keyfreq json-mode go-tag go-playground go-impl go-gen-test go-fill-struct go-dlv flycheck-golangci-lint flycheck-color-mode-line exec-path-from-shell embark-consult corfu consult-yasnippet cargo cape auto-package-update atom-one-dark-theme all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
