;; less
(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))

;; css
(add-hook 'css-mode-hook (lambda () (setq css-indent-offset 2)))
