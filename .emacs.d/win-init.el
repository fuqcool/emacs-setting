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

;; color theme
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-robin-hood)

(linum-mode)

(when (string-equal system-type "darwin")
  (set-frame-position (selected-frame) 0 0)
  (set-frame-width (selected-frame)
                   (- (/ (x-display-pixel-width) (frame-char-width)) 4)))

(add-to-list 'load-path "~/.emacs.d/plugins/flymake")
;; show error message in mini buffer
(require 'flymake-cursor)
;; show errors on fringe
(require 'rfringe)
