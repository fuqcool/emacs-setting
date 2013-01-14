;; hide tool bar
(tool-bar-mode nil)

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

;; shortcuts
;; f1 -> shell
(global-set-key [f1] 'shell)
;; f12 -> open .emacs
(global-set-key [f12] (lambda ()
                        (interactive)
                        (find-file "~/.emacs")))
;; Click C-a go to beginning of line, click again
;; go to beginning of line text.
(global-set-key "\C-a"
                (lambda ()
                  (interactive)
                  (if (= (point) (line-beginning-position))
                      (beginning-of-line-text)
                    (beginning-of-line))))
;; kill whole line
(global-set-key "\C-k" 'kill-whole-line)
;; \C-; => comment or uncomment line
(global-set-key [(control ?\;)]
                (lambda ()
                  (interactive)
                  (comment-or-uncomment-region (line-beginning-position)
                                               (line-end-position))))

;; copy region or whole line
(global-set-key "\M-w"
                (lambda ()
                  (interactive)
                  (if mark-active
                      (kill-ring-save (region-beginning)
                                      (region-end))
                    (progn
                      (kill-ring-save (line-beginning-position)
                                      (line-end-position))
                      (message "copied line")))))

;; kill region or whole line
(global-set-key "\C-w"
                (lambda ()
                  (interactive)
                  (if mark-active
                      (kill-region (region-beginning)
                                   (region-end))
                    (progn
                      (kill-region (line-beginning-position)
                                   (line-end-position))
                      (message "killed line")))))

;; display line numbers
;; line-mode is useless in some cases, so I just list out the
;; modes in which I would like to enable line numbers.
(mapcar (lambda (mode) (add-hook mode 'linum-mode))
        '(python-mode-hook
          scheme-mode-hook
          c-mode-hook
          emacs-lisp-mode-hook
          js-mode-hook
          ruby-mode-hook))

;; open json file in javascript mode
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
;; open rakefile in ruby mode
(add-to-list 'auto-mode-alist '("[Rr]akefile$" . ruby-mode))
;; js-mode setting
(setq js-auto-indent-flag nil)
;; (setq js-indent-level 2)

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

;; color theme
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-robin-hood)

(add-to-list 'load-path "~/.emacs.d/plugins/flymake")
;; show error message in mini buffer
(require 'flymake-cursor)
;; show errors on fringe
(require 'rfringe)

;; flymake for js
(add-to-list 'load-path "~/.emacs.d/plugins/flymake/js")
(require 'flymake-jslint)
(setq jslint-command "~/.emacs.d/plugins/flymake/js/jslint-wrapper")
;; (add-hook 'js-mode-hook (lambda () (flymake-mode t)))

;; Check syntax only when saving, so it will be less annoying. :-)
(eval-after-load "flymake"
  '(progn
     (defun flymake-after-change-function (start stop len)
       "Start syntax check for current buffer if it isn't already running."
       ;; Do nothing, don't want to run checks until I save.
       )))

(setq jslint-predefs '("$"))
(setq jslint-flags
      '("plusplus"
        "browser"
        "nomen"
        "vars"))
(setq jslint-command-options
      '(("indent" . 4)
        ("maxerr" . 100)
        ("maxlen" . 120)))
