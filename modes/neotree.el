;; Neotree (side view file browser)
(use-package neotree
  :bind ("<f8>" . neotree-toggle))

(setq neo-window-position 'right) ; Set the window to be on the right
(setq neo-smart-open t) ; Jumps to current file when opened
(setq projectile-switch-project-action 'neotree-projectile-action) ; Makes neotree jump to the current project folder with projectile
(setq neo-window-width 46) ; Set the view to be wider
(setq neo-window-fixed-size nil) ; Allow neotree to be adjusted

;; Set the neo-window-width to the current width of the
;; neotree window, to trick neotree into resetting the
;; width back to the actual window width.
;; Fixes: https://github.com/jaypei/emacs-neotree/issues/262
(eval-after-load "neotree"
  '(add-to-list 'window-size-change-functions
                (lambda (frame)
                  (let ((neo-window (neo-global--get-window)))
                    (unless (null neo-window)
                      (setq neo-window-width (window-width neo-window)))))))

(use-package all-the-icons
  :if (display-graphic-p))
  
; set the theme of neotree
(setq neo-theme (if (display-graphic-p) 'icons))

; make it open the current files folder on startup after desktop loaded
(defun neo-open-current-file-dir ()
  "Open NeoTree using the directory of the current file."
  (interactive)
  (let ((file-path (buffer-file-name)))
    (if file-path
        (neo-buffer--start (file-name-directory file-path))
      (message "No file associated with this buffer."))))

(add-hook 'desktop-after-read-hook 'neo-open-current-file-dir)