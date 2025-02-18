;; Add the elisp to the load path so we can require it
(add-to-list 'load-path "~/.emacs.d/elisp/")


;; Load the components of the config
(require 'theme)
(require 'lsp)
(require 'advanced-cua)
