;;; package --- init-rust  -*- lexical-binding: t -*-
;;; Commentary:
;;; code:

(use-package rust-mode)
(use-package cargo-mode
  :config
  (add-hook 'rust-mode-hook 'cargo-minor-mode))


(provide 'init-rust)
;;; init-rust.el ends here
