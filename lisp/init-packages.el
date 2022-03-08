;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |
;; -*- lexical-binding: t -*-

(require 'package)
(setq package-archives '(("melpa" . "http://elpa.zilongshanren.com/melpa/")
                         ("gnu" . "http://elpa.zilongshanren.com/gnu/")))


;; Initialize packages
(unless (bound-and-true-p package--initialized) ; To avoid warnings in 27
  (setq package-enable-at-startup nil)          ; To prevent initializing twice
  (package-initialize))

;; Setup `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Should set before loading `use-package'
(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-always-defer t)
  (setq use-package-expand-minimally t)
  (setq use-package-enable-imenu-support t))

(eval-when-compile
  (require 'use-package))

(defvar use-package-selected-packages '(use-package)
  "Packages pulled in by use-package.")

;; Auto update packages
;; this maybe useful, if you want to update all the packages with command, just like me
(use-package auto-package-update
  :init (setq auto-package-update-delete-old-versions t
	          auto-package-update-hide-results t))


;; popwin
(use-package popwin
  :hook (after-init . popwin-mode))

;; recentf

(use-package recentf
  :hook (after-init . recentf-mode)
  :bind
  ("C-x C-r" . recentf-open-files)
  :config
  (setq-default recentf-max-menu-item 10
		recentf-max-saved-items 20)
  (add-to-list 'recentf-exclude '("~\/.emacs.d\/elpa\/")))


(use-package flycheck
  :hook (after-init . global-flycheck-mode)
  :config
  (setq flycheck-emacs-lisp-load-path 'inherit)

  ;; And don't recheck on idle as often
  (setq flycheck-idle-change-delay 1.0)

  ;; For the above functionality, check syntax in a buffer that you switched to
  ;; only briefly. This allows "refreshing" the syntax check state for several
  ;; buffers quickly after e.g. changing a config file.
  (setq flycheck-buffer-switch-check-intermediate-buffers t)

  ;; Display errors a little quicker (default is 0.9s)
  (setq flycheck-display-errors-delay 0.25)

  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list
        flycheck-check-syntax-automatically '(idle-change mode-enabled)))

(use-package flycheck-color-mode-line
  :hook (flycheck-mode . flycheck-color-mode-line-mode)
  :after flycheck)


;; (use-package flymake			
;;   :hook (prog-mode . flymake-mode)
;;   :config
;;   (global-set-key (kbd "M-n") #'flymake-goto-next-error)
;;   (global-set-key (kbd "M-p") #'flymake-goto-prev-error))

(use-package prog-mode
  :ensure nil
  :config (global-prettify-symbols-mode t))

;; YASnippet
(use-package yasnippet
  :diminish yas-minor-mode
  :hook ((prog-mode org-mode) . yas-minor-mode)
  :bind (("C-c y i" . yas-insert-snippet)
         ("C-c y f" . yas-visit-snippet-file)
         ("C-c y n" . yas-new-snippet)
         ("C-c y t" . yas-tryout-snippet)
         ("C-c y l" . yas-describe-tables)
         ("C-c y g" . yas-global-mode)
         ("C-c y m" . yas-minor-mode)
         ("C-c y r" . yas-reload-all)
         ("C-c y x" . yas-expand)
         :map yas-keymap
         ("C-i" . yas-next-field-or-maybe-expand))
  :config
  (yas-reload-all))

(use-package yasnippet-snippets
  :defer t
  :after yasnippet)

(use-package consult-yasnippet
  :defer t
  :after (consult yasnippet)
  :bind ("M-s y" . consult-yasnippet))

;; show hot keys
(use-package which-key
  :defer t
  :config (which-key-mode 1))

;; magit

(use-package magit)
(provide 'init-packages)

;;; init-packages.el ends here

