;;; init.el
;; Martin emacs basic setting


;;; code:
(add-to-list 'load-path "~/.emacs.d/lisp/")


(require 'init-packages)
(require 'init-system)
(require 'init-smartpair)
(require 'init-utils)
(require 'init-meow)
;; (require 'init-project)
;; ;;(require 'init-flycheck)

(require 'init-consult)
(require 'init-vertico)
(require 'init-yasnippet)
;;(require 'init-corfu)
;; ;; edit mode settings
(require 'init-program)
(require 'init-org)
(require 'init-markdown)
;; ;; programing language settings
(require 'init-go)
(require 'init-python)
(require 'init-rust)

(require 'init-lspbridge)
;;(require 'init-treemacs)
;; ;;(require 'init-lsp)
;;(require 'init-eglot)
;; ;;(require 'init-eaf)
(require 'init-treesitter)



;;; init.el ends here
