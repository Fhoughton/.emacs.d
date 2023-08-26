;; Set up 'package' and add MELPA to its list, then initialize it
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(require 'use-package)

;; Installed packages and their purpose
(use-package expand-region 
	:bind (("C-=" . er/expand-region))) ; select regions dynamically, e.g. inside of strings

;; DLang	
(use-package d-mode)

; fix for compiling
(require 'compile)
(add-to-list
 'compilation-error-regexp-alist
 '("^\\([^ \n]+\\)(\\([0-9]+\\)): \\(?:error\\|.\\|warnin\\(g\\)\\|remar\\(k\\)\\)"
   1 2 nil (3 . 4)))