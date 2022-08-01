;;; package --- init-utils -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; code:


;; magit
(use-package magit)

;;(require 'awesome-tray)
;;(awesome-tray-mode 1)


;; ebook reader
(use-package nov)
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(defun my-nov-font-setup ()
  (face-remap-add-relative 'variable-pitch :family "Liberation Serif"
                                           :height 1.0))
(add-hook 'nov-mode-hook 'my-nov-font-setup)


;; HideShow Minor Mode
(use-package hideshow
  :ensure nil
  :diminish hs-minor-mode
  :hook (prog-mode . hs-minor-mode))

;; subword`可以处理`CamelCasesName`这种驼峰式的单词，<kbd>M-f</kbd>
;; (`forward-word`) 后，光标会依次停在大写的词上。
(use-package subword
  :ensure nil
  :hook (after-init . global-subword-mode))

;; repeat mode 连续使用c-x时可以不用连续使用c-x
(use-package repeat
  :ensure nil
  :hook (after-init . repeat-mode)
  :custom
  (repeat-exit-key (kbd "RET")))

;; show hot keys
(use-package which-key
  :defer t
  :config (which-key-mode 1))

;;marginalia

;; Enable richer annotations using the Marginalia package
(use-package marginalia
  ;; Either bind `marginalia-cycle` globally or only in the minibuffer
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init configuration is always executed (Not lazy!)
  :init

  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode))


(use-package multiple-cursors
  :bind (("C->"           . mc/mark-next-like-this)
         ("C-<"           . mc/mark-previous-like-this)
         ("C-M->"         . mc/skip-to-next-like-this)
         ("C-M-<"         . mc/skip-to-previous-like-this)
         ("C-c C-<"       . mc/mark-all-like-this)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click)
         ("C-S-c" . mc/edit-line)
         ("C-c C->" . mc/mark-all-symbols-like-this)
         :map mc/keymap
         ("C-|" . mc/vertical-align-with-space))
  :config
  (setq mc/insert-numbers-default 1))


(use-package keyfreq
  :init
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1)
  :config
  (setq keyfreq-excluded-commands
        '(self-insert-command
          forward-char
          backward-char
          previous-line
          keyboard-quit
          vertico-next
          vertico-previous
          backword-delete-char-untabify
          delete-backward-char
          mwheel-scroll
          minibuf-keybroad-quit
          move-end-of-line
          save-buffer
          next-line)))

(require 'thing-edit)

(provide 'init-utils)
;;; init-utils.el ends here
