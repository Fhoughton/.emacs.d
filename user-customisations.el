;; Enable cua mode (Ctrl-C, Ctrl-V, Ctrl-X etc., default keys for most programs)
(cua-mode 1)

;; Make emacs use a normal cursor
(setq-default cursor-type 'bar) 
(blink-cursor-mode nil)

;; Enable the tab bar
(tab-bar-mode 1)

;; Disable the scroll bar
(scroll-bar-mode -1)

;; Disable the tool bar
(tool-bar-mode -1)

;; Enable desktop saves, saving opened files on exit
(desktop-save-mode 1)

;; Save the place the cursor was at in files upon closure
(save-place-mode 1)

;; Save the recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)