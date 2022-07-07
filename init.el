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

(require 'init-utils)
(require 'init-project)
(require 'init-flycheck)
(require 'init-consult)
(require 'init-corfu)
(require 'init-yasnippet)
;;(require 'init-lsp)
(require 'init-markdown)
(require 'init-lspbridge)
;;(require 'init-eglot)

(require 'init-org)

(require 'init-go)
(require 'init-python)
(require 'init-treemacs)
(require 'init-rust)
;;(require 'init-eaf)
;;(require 'init-treesitter)




;;; init.el ends here
