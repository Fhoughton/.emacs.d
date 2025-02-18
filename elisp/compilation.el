;; By default we want the mode to decide what compilation command is used
;; So we stop emacs from asking and run the mode's default

;; TODO: Make python run main.py if available, otherwise current file
;;       - May require a retooling of how we do compile where we override the original?

;; Changes emacs behaviour by default to not ask for compilation commands
(setq compilation-read-command nil)

(defun compile-with-command ()
  "Runs compile with the default emacs behaviour"
  (interactive)
  (setq compilation-read-command t)
  (call-interactively 'compile)
  (setq compilation-read-command nil))

(provide 'compilation)
