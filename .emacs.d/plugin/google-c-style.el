(require 'google-c-style)

(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; use c++ mode when openning c/c++ header files
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
