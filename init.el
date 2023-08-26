;; Set the home directory
(setq user-emacs-directory "~/.emacs.d/")
(setq modes-config-directory (concat user-emacs-directory "modes/"))

;; Disable native comp warnings
(setq native-comp-async-report-warnings-errors nil)

;; Write a function to handle file loading
(defun load-user-file (file)
	(interactive)
	"Load a file from the user emacs directory"
	(load-file (expand-file-name file user-emacs-directory)))

;; Load the other config files
(load-user-file "packages.el") ; Package management

;; Disable home littering
(setq no-littering-etc-directory
      (expand-file-name "config/" user-emacs-directory))
(setq no-littering-var-directory
      (expand-file-name "data/" user-emacs-directory))
(require 'no-littering)

;; Load the rest of the config files
(load-user-file "user-functions.el") ; Custom functions
(load-user-file "user-customisations.el") ; Visual customisations

(defun load-files-in-directory (directory)
  "Load all Emacs Lisp files in the given DIRECTORY."
  (dolist (file (directory-files directory t "\\.el$"))
    (when (file-regular-p file)
      (load file))))

;; Load the mode configs
(load-files-in-directory modes-config-directory)

;; Custom set variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f1b2de4bc88d1120782b0417fe97f97cc9ac7c5798282087d4d1d9290e3193bb" "435d18aff74c0e98dae5e32555237eb8391faaafe1582b6d4be867b8975dba29" "18624b2da7749af193a4eeaa7be1dc2abe94a97a8562ba69f5ee0f06d6dd156e" "aeb5508a548f1716142142095013b6317de5869418c91b16d75ce4043c35eb2b" "b273d59159ef19d49ddb6176eee2b3283dbe1afbed931d7affae4508e560eac1" default))
 '(package-selected-packages
   '(polymode org-babel-eval-in-repl use-package expand-region)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )