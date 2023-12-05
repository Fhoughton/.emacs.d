;; Basic function to allow reloading of config
(defun reload-config ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun load-config ()
  (interactive)
  (find-file "~/.emacs.d/config.org"))

;; Bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
 (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
(bootstrap-version 6))
(unless (file-exists-p bootstrap-file)
(with-current-buffer
  (url-retrieve-synchronously
   "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
   'silent 'inhibit-cookies)
(goto-char (point-max))
(eval-print-last-sexp)))
(load bootstrap-file nil 'nomessage))

;; Then configure it
(setq straight-use-package-by-default t
	use-package-always-defer t
	straight-cache-autoloads t
	straight-vc-git-default-clone-depth 1
	straight-check-for-modifications '(find-when-checking)
	package-enable-at-startup nil
	vc-follow-symlinks t)

;; Get use-package
(straight-use-package 'use-package)

;; Configure use-package to use straight.el by default
(use-package straight
  :custom
  (straight-use-package-by-default t))

;; Load org
(use-package org)

;; Configure org-babel
(org-babel-do-load-languages
     'org-babel-load-languages
     '((emacs-lisp . nil)))

;; Load the literate config
(defun tangle-config ()
  "Tangle 'config.org' if it's newer than `init.el'."
  (interactive)
  (let ((org-file (expand-file-name "~/.emacs.d/config.org"))
        (el-file (expand-file-name "~/.emacs.d/config.el")))
    (when (or (not (file-exists-p el-file))
              (file-newer-than-file-p org-file el-file))
      (org-babel-tangle-file org-file el-file "emacs-lisp"))))

;; Automatically tangle on Emacs startup
;;(add-hook 'after-init-hook 'tangle-config)
(tangle-config)

;; Load the config.el file generated from config.org
(load "~/.emacs.d/config.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil org-roam org-modern ivy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
