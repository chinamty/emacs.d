;;; package --- init-rust  -*- lexical-binding: t -*-
;;; Commentary:
;;; code:
(add-to-list 'exec-path (expand-file-name "~/.cargo/bin"))

(use-package rust-mode
  :hook (rust-mode . my/rust-compile)
  :config
  (setq rust-format-on-save t)

  (defun my/rust-compile ()
    (setq-local compile-command "cargo check --color never --tests")))


(use-package cargo
  :hook ((rust-mode . cargo-minor-mode))
  :config
  (defun my/cargo-test-current ()
    (interactive)
    (setenv "RUST_LOG" "debug")
    (cargo-process-current-test))
  :bind (:map rust-mode-map
         (("C-c C-t" . my/cargo-test-current)))
  :custom ((cargo-process--command-current-test "test --color never")
           (cargo-process--enable-rust-backtrace t)
           (cargo-process--command-flags "--  --nocapture")))


(provide 'init-rust)
;;; init-rust.el ends here
