;; Fetches the sexp at the editor cursor as a quoted expression
(defun sexp-at-point ()
  "Fetch the sexp at the point as a quoted expression"
  (car (read-from-string (thing-at-point 'sexp)))
  )

;; Prints the sexp at the editor cursor
(defun sexp-print ()
  "Print the sexp at the cursor"
  (interactive)
  (print (sexp-at-point))
  )

;; Swap two symbols in the sexp at the editor cursor
(defun swap-symbol-in-buffer (old-symbol new-symbol)
  "Replace all occurrences of OLD-SYMBOL with NEW-SYMBOL in the current buffer."
  (save-excursion
    (goto-char (point-min))
    (while (search-forward (symbol-name old-symbol) nil t)
      (backward-char (length (symbol-name old-symbol)))
      (delete-region (point) (+ (point) (length (symbol-name old-symbol))))
      (insert (symbol-name new-symbol)))))

;; Swap two symbols in the sexp at the editor cursor, specifying the old and new symbol interactively
(defun sexp-swap-symbols ()
  "Interactive function to swap symbols in the current buffer."
  (interactive)
  (let* ((old-symbol (intern (read-string "Enter the symbol to replace: ")))
         (new-symbol (intern (read-string "Enter the symbol to replace with: "))))
    (swap-symbol-in-buffer old-symbol new-symbol)))
	
;; Keybinds to custom scripts
(global-set-key (kbd "C-c C-s") 'sexp-swap-symbols)
	
;; Reload the config file
(defun reload-config ()
	(interactive)
	(load-user-file "init.el"))