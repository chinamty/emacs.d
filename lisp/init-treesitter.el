;;; package --- init-treesitter.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package tree-sitter)
(use-package tree-sitter-langs)

(add-hook 'go-mode-hook #'tree-sitter-mode)
(global-tree-sitter-mode)

(provide 'init-treesitter)

;;; init-treesitter.el ends here

