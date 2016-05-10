;; hide tool bar
(tool-bar-mode 0)

;; hide scroll bar
(scroll-bar-mode 0)

;; share clipboard with external programs
(setq x-select-enable-clipboard t)

;; insert spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; do not backup
(setq make-backup-files nil)

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

;; Ask before exit
(setq confirm-kill-emacs 'yes-or-no-p)

;; show line numbers
(global-linum-mode)

;; Always reserve 3-digit-width when line number is less than 100.
(setq linum-format "%3d")

;; remember emacs sessions on restart
(desktop-save-mode 1)
