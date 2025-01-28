;; Altered Defaults
(add-to-list 'default-frame-alist '(fullscreen . maximized)) ; Start fullscreen
(tool-bar-mode -1) ; Hide the icons above the minibuffer
(scroll-bar-mode -1) ; Hide the scrollbar

;; Font
(set-frame-font "Roboto Mono 14" nil t)

;; Spacing
(set-fringe-mode 0) ; Remove fringe (bar on left of code)
(setq-default left-margin-width 2 right-margin-width 2) ; Define left and right margin (fixes centering after removing fringe)
(set-window-buffer nil (current-buffer)) ; Enable the new margins

;; Colours

;; Modeline
(setq-default header-line-format mode-line-format) ; Make the header line contain the same information as the mode-line
(setq-default mode-line-format nil) ; Hide the mode-line

;; Minibuffer

(provide 'theme)
