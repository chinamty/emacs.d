;;; init-project ---  _-*- lexical-binding: t -*-
;;; commentary:

;;; code:

(defun my/project-try-local (dir)
  "Determine if DIR is a non-Git project."
  (catch 'ret
    (let ((pr-flags '((".project")
                      ("go.mod" "Cargo.toml" "project.clj" "pom.xml" "package.json") ;; higher priority
                      ("Makefile" "README.org" "README.md"))))
      (dolist (current-level pr-flags)
        (dolist (f current-level)
          ;; (message "d %s f %s" dir f)
          (when-let ((root (locate-dominating-file dir f)))
            (throw 'ret (cons 'local root))))))))

(setq project-find-functions '(my/project-try-local project-try-vc))

(cl-defmethod project-root ((project (head local)))
  (cdr project))

(defun my/project-files-in-directory (dir)
  "Use `fd' to list files in DIR."
  (let* ((default-directory dir)
         (localdir (file-local-name (expand-file-name dir)))
         (command (format "fd -H -t f -0 . %s" localdir)))
    (project--remote-file-names
     (sort (split-string (shell-command-to-string command) "\0" t)
           #'string<))))

(cl-defmethod project-files ((project (head local)) &optional dirs)
  "Override `project-files' to use `fd' in local projects."
  (mapcan #'my/project-files-in-directory
          (or dirs (list (project-root project)))))

(defun my/add-dot-project ()
  (interactive)
  (let* ((root-dir (read-directory-name "Root: "))
         (f (expand-file-name ".project" root-dir)))
    (message "Create %s..." f)
    (make-empty-file f)))

(defun my/project-info ()
  (interactive)
  (message "%s" (project-current t)))

(defun my/project-discover ()
  (interactive)
  (dolist (search-path '("~/code/" "~/gh/" "~/code/antfin/" "~/code/misc"))
    (dolist (file (file-name-all-completions  "" search-path))
      (when (not (member file '("./" "../")))
        (let ((full-name (expand-file-name file search-path)))
          (when (file-directory-p full-name)
            (when-let ((pr (project-current nil full-name)))
              (project-remember-project pr)
              (message "add project %s..." pr))))))))

(defun my/project-recentf ()
  (interactive)
  (let* ((pr (project-current t))
         (root-dir (expand-file-name (project-root pr)))
         (files (or (thread-last
                        recentf-list
                      (seq-filter (lambda (filename)
                                    (and (string-prefix-p root-dir filename)
                                         (if-let ((curr-name (buffer-file-name)))
                                             (not (string-equal curr-name filename))
                                           t))))
                      (mapcar 'abbreviate-file-name))
                    (project-files proj))))
    (ivy-read "Recentf: " files
              :action 'find-file)))

(defun my/makefile-targets (dir)
  "Find Makefile targets in dir. https://stackoverflow.com/a/58316463/2163429"
  (let* ((default-directory dir))
	(with-temp-buffer
	  (insert (shell-command-to-string "make -qp"))
	  (goto-char (point-min))
	  (let ((targets '()))
		(while (re-search-forward "^\\([a-zA-Z0-9][^$#\\/\\t=]*\\):[^=|$]" nil t)
		  (let ((target (match-string 1)))
			(unless (member target '("Makefile" "make" "makefile" "GNUmakefile"))
			  (push target targets))))
		(sort targets 'string-lessp)))))

(defun my/project-run-makefile-target ()
  (interactive)
  (let* ((pr (project-current t))
		 (default-directory (project-root pr))
		 (target (completing-read "Target: " (my/makefile-targets default-directory)))
         (buf-name "*Async Makefile Target*"))
    (when-let (b (get-buffer buf-name))
      (kill-buffer b))
	(async-shell-command (concat "make " (shell-quote-argument target)) buf-name)))

(defun my/project-citre ()
  (interactive)
  (let ((default-directory (project-root (project-current t))))
    (citre-create-tags-file)
    (add-dir-local-variable 'prog-mode 'eval '(citre-mode))))

(defun my/project-rg ()
  (interactive "")
  (let* ((default-directory (project-root (project-current t)))
         (word (thing-at-point 'symbol t))
         (target (if word
                     (read-string (format "Search (%s): " word) nil nil word)
                   (read-string "Search: "))))
    (counsel-rg target default-directory "--hidden")))


(provide 'init-project)

;;; init-project.el ends here
