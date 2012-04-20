;; hide tool bar
(tool-bar-mode nil)

;; Iterate a list of fonts, if current font exists, set
;; font style and size.
(defun try-set-font (font-list)
  (defun font-exists (font-name)
    (if (null (x-list-fonts font-name))
        nil t))
  (when font-list
    (let ((font-name (car (car font-list)))
          (font-size (cdr (car font-list))))
      (if (font-exists font-name)
          (set-default-font (concat font-name "-" 
                                    (number-to-string font-size)))
        (try-set-font (cdr font-list))))))

(try-set-font '(("Monaco" . 12)
                ("Consolas" . 13)
                ("DejaVuSans Mono" . 12)
                ("Courier New" . 12)))

;; share clipboard with external programs
(setq x-select-enable-clipboard t)

;; insert spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; shortcuts
;; f1 -> shell
(global-set-key [f1] 'shell)
;; Click C-a go to beginning of line, click again
;; go to beginning of line text.
(global-set-key "\C-a"
                (lambda ()
                  (interactive)
                  (if (= (point) (line-beginning-position))
                      (beginning-of-line-text)
                    (beginning-of-line))))
;; kill whole line
(global-set-key "\C-k"
                (lambda ()
                  (interactive)
                  (kill-whole-line)))

;; display line numbers
;; line-mode is useless in some cases, so I just list out the
;; modes in which I would like to enable line numbers.
(mapcar (lambda (mode) (add-hook mode 'linum-mode))
        '(python-mode-hook
          scheme-mode-hook
          c-mode-common-mode-hook
          emacs-lisp-mode-hook))

;; Use text mode as default major mode.
(setq default-major-mode 'text-mode)

;; ignore buffer name cases
(setq read-buffer-completion-ignore-case t)
;; ignore file name cases
(setq read-file-name-completion-ignore-case t)

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