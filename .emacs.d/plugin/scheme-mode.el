;; racket
(add-to-list 'auto-mode-alist '("\\.rkt$" . scheme-mode))
(add-hook 'scheme-mode-hook
          (lambda () (highlight-lines-matching-regexp ".\\{81\\}" "red")))
