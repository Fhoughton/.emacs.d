(use-package org)

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

(use-package polymode)
(use-package org-agda-mode
  :straight (:host github
		   :repo "alhassy/org-agda-mode"
		   :branch "master"
		   :files ("org-agda-mode.el")
		   )
  )

(defun my-agda-with-buffer-restore (in-file)
  "Execute Agda code with buffer and window restoration."
  (interactive)
  (let ((current-buffer (current-buffer))
        (current-window-config (current-window-configuration))
        (in-file (org-babel-temp-file "n" ".agda")))
    ;; Save the current buffer content to the temporary file
    (with-temp-file in-file
      (insert (buffer-string)))

    ;; Execute Agda code with agda2-go
    (agda2-go 'save t 'busy t "Cmd_load"
              (agda2-string-quote in-file)
              (agda2-list-quote agda2-program-args))

    ;; Restore the original buffer and window configuration
    (with-selected-window (get-buffer-window current-buffer)
      (switch-to-buffer current-buffer)
      (set-window-configuration current-window-config))))
	  
(defun org-babel-execute:agda2 (body params)
  "Execute a block of Agda code with org-babel."
  
  ; Make a temporary file to act upon
  (let ((in-file (org-babel-temp-file "n" ".agda")))
  (with-temp-file in-file
    (insert body))
	
  ; Evaluate the file
  (my-agda-with-buffer-restore in-file)))