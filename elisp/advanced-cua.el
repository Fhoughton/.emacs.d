;; Enable cua
(cua-mode 1)

;; TODO:
;; Make C-c, C-x work on the whole line if nothing is selected

;; Add searching and saving keybinds
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-s") 'save-buffer)

(provide 'advanced-cua)
