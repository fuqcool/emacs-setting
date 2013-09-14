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
(add-to-list 'auto-mode-alist '("^[Rr]akefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rkt$" . scheme-mode))
;; js-mode setting
(setq js-auto-indent-flag nil)
(setq js-indent-level 2)

;; set emacs PATH to shell PATH
(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)

(when (display-graphic-p)
  ;; hide tool bar
  (tool-bar-mode 0)

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

  (try-set-font '(("Monaco" . 17)
                  ("Consolas" . 13)
                  ("DejaVuSans Mono" . 12)
                  ("Courier New" . 12)))

  ;; show line numbers
  (global-linum-mode)
  ;; Always reserve 3-digit-width when line number is less than 100.
  (setq linum-format "%3d")

  (when (string-equal system-type "darwin")
    (set-frame-position (selected-frame) 0 0)
    (set-frame-width (selected-frame)
                     (- (/ (x-display-pixel-width) (frame-char-width)) 4)))

  )
