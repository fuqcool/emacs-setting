(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tool-bar-mode nil))

;; Iterate a list of fonts, if current font exists, set
;; font style and size.
(defun try-set-font (font-list font-size)
  (defun font-exists (font-name)
    (if (null (x-list-fonts font-name))
        nil t))
  (when font-list
    (let ((font-name (car font-list)))
      (if (font-exists font-name)
          (set-default-font (concat font-name "-" 
                                    (number-to-string font-size)))
        (try-set-font (cdr font-list) font-size)))))

(try-set-font
 '("Monaco" "DejaVu Sans Mono" "Courier New")
 12)

;; share clipboard with external programs
(setq x-select-enable-clipboard t)

;; insert spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; shortcuts
;; f1 -> shell
(global-set-key [f1] 'shell)
(global-set-key "\C-a"
                (lambda ()
                  (interactive)
                  (if (= (point) (line-beginning-position))
                      (beginning-of-line-text)
                    (beginning-of-line))))

;; display line numbers
;; line-mode is useless in some cases, so I just list out the
;; modes in which I would like to enable line numbers.
(mapcar (lambda (mode) (add-hook mode 'linum-mode))
        '(python-mode-hook
          scheme-mode-hook
          c-mode-common-mode-hook
          emacs-lisp-mode-hook))

;; Always reserve 3-digit-width when line number is less than 100.
(setq linum-format "%3d")

;; my emacs plugins
;; 1. yasnippet
;; 2. google-c-style
;; 3. auto-complete
;; 4. ibus
;; 5. yaml-mode
;; 6. color-theme

(add-to-list 'load-path "~/.emacs.d/plugins")

;; yasnippet
;; (add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
;; (require 'yasnippet)
;; (yas/initialize)
;; (yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

;; google c style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
;; use c++ mode when openning c/c++ header files
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

;; auto complete
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
	     (add-to-list 'load-path "~/.emacs.d/plugins/auto-complete/ac-dict"))
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

;; color theme
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-robin-hood)