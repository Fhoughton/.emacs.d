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
(set-face-attribute 'default nil
		    :foreground "#37474F")

(set-face-attribute 'region nil
		    :background "#ECEFF1")

(set-face-attribute 'font-lock-keyword-face nil
		    :foreground "#673AB7")

(set-face-attribute 'font-lock-builtin-face nil
		    :foreground "#673AB7")

(set-face-attribute 'font-lock-string-face nil
		    :foreground "#FFAB91")

(set-face-attribute 'font-lock-comment-face nil
		    :foreground "#90A4AE")

;; (set-face-attribute 'font-lock-function-name-face nil
;; 		    :foreground "#263238")

;; (set-face-attribute 'font-lock-variable-name-face nil
;; 		    :foreground "#263238"
;; 		    :weight 'bold)

;; Modeline
(setq-default header-line-format mode-line-format) ; Make the header line contain the same information as the mode-line
(setq-default mode-line-format nil) ; Hide the mode-line

;; Minibuffer

(provide 'theme)
