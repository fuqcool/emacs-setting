(add-to-list 'load-path "~/.emacs.d/plugins")

;; yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)
(setq yas/prompt-functions
      '(yas/dropdown-prompt
        yas/completing-prompt))


;; dropdown list
(require 'dropdown-list)
(set-face-foreground 'dropdown-list-face "black")
(set-face-background 'dropdown-list-face "lightgray")
(set-face-foreground 'dropdown-list-selection-face "white")
(set-face-background 'dropdown-list-selection-face "steelblue")


;; google c style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
;; use c++ mode when openning c/c++ header files
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))


;; auto complete
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete/dict")
(ac-config-default)
;; Use C-n, C-p to navigate candidates.
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
;; Manually trigger auto complete.
(setq ac-auto-start nil)
(global-set-key "\M-/" 'ac-start)
(define-key ac-complete-mode-map "\M-/" 'ac-stop)


;; yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))


(load-file "~/.emacs.d/plugins/geiser/elisp/geiser.el")
(setq geiser-active-implementations '(racket))


;; paredit
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)
(add-hook 'scheme-mode-hook 'enable-paredit-mode)


(when (display-graphic-p)
  ;; color theme
  (add-to-list 'load-path "~/.emacs.d/plugins/color-theme")
  (require 'color-theme)
  (color-theme-initialize)
  (color-theme-robin-hood)

  ;; flymake
  (add-to-list 'load-path "~/.emacs.d/plugins/flymake")
  ;; show error message in mini buffer
  (require 'flymake-cursor)
  ;; show errors on fringe
  (require 'rfringe)

  )
