(when (display-graphic-p)
  (load-file "~/.emacs.d/win-init.el")) ;

(load-file "~/.emacs.d/key-bindings.el")

;; share clipboard with external programs
(setq x-select-enable-clipboard t)

;; insert spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; prefer utf-8
(setq prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; ignore buffer name cases
(setq read-buffer-completion-ignore-case t)
;; ignore file name cases
(setq read-file-name-completion-ignore-case t)

;; find true name of a file
(setq find-file-visit-truename t)
(setq find-file-suppress-same-file-warnings t)

;; Use text mode as default major mode.
(setq default-major-mode 'text-mode)

;; Set title format -- display file name or buffer name.
(setq frame-title-format '(buffer-file-name "%f" "%b"))

;; Remove trailing whitespaces.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; open json file in javascript mode
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
;; open rakefile in ruby mode
(add-to-list 'auto-mode-alist '("[Rr]akefile$" . ruby-mode))
;; js-mode setting
(setq js-auto-indent-flag nil)
(setq js-indent-level 2)

;; Always reserve 3-digit-width when line number is less than 100.
(setq linum-format "%3d")

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
