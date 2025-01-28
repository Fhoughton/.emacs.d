;;; Eglot
(add-hook 'prog-mode-hook 'eglot-ensure)

(add-hook
 'eglot-managed-mode-hook
 (lambda ()
   (eldoc-mode -1))) ;; Remove eldoc type info

(add-hook 'eglot-managed-mode-hook (lambda () (eglot-inlay-hints-mode -1))) ;; Remove argument names from being displayed in the buffer like VSCode

;;; Flymake (C & C++ lsp for eglot)
;; Make error info prettier (solid line rather than squiggly)
(with-eval-after-load 'flymake
  (set-face-attribute 'flymake-error nil
                      :underline '(:style line :color "red"))
  (set-face-attribute 'flymake-warning nil
                      :underline '(:style wave :color "orange"))
  (set-face-attribute 'flymake-note nil
                      :underline '(:style line :color "yellow")))

;; Add keyboard movement for flymake
(add-hook 'eglot-managed-mode-hook
  (lambda ()
    (local-set-key (kbd "M-n") 'flymake-goto-next-error)
    (local-set-key (kbd "M-p") 'flymake-goto-prev-error)))

(provide 'lsp)
