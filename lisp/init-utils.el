;;; package --- init-utils -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; code:


;; add third party packages load path

(add-to-list 'load-path "~/.emacs.d/packages/auto-save")
(require 'auto-save)
(auto-save-enable)
(setq auto-save-silent t)
(setq auto-save-delete-trailing-whitespace t)

;; magit

(use-package magit)
;; 自动cover被外部修改的文件
(use-package autorevert
  :ensure nil
  :hook (after-init . global-auto-revert-mode))


;; (use-package smartparens
;;   :init
;;   (smartparens-global-mode t)
;;   (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
;;   (sp-local-pair 'emacs-lisp-mode "`" nil :actions nil)
;;   (sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)
;;   :config
;;     (sp-with-modes
;;         '(c++-mode objc-mode c-mode go-mode)
;;       (sp-local-pair "{" nil :post-handlers '(:add ("||\n[i]" "RET")))))


;; ebook reader
(use-package nov)
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(defun my-nov-font-setup ()
  (face-remap-add-relative 'variable-pitch :family "Liberation Serif"
                                           :height 1.0))
(add-hook 'nov-mode-hook 'my-nov-font-setup)


;; popwin
(use-package popwin
  :hook (after-init . popwin-mode))

;; recentf

(use-package recentf
  :hook (after-init . recentf-mode)
  :config
  (setq-default recentf-max-menu-item 10
		recentf-max-saved-items 20)
  (add-to-list 'recentf-exclude '("~\/.emacs.d\/elpa\/")))



(use-package prog-mode
  :ensure nil
  :config (global-prettify-symbols-mode t))


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
(use-package json-mode)
;; (use-package projectile
;;   :ensure t
;;   :config
;;   (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;;   (projectile-mode +1))

(provide 'init-utils)
;;; init-utils.el ends here
