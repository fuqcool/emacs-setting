(require 'package)
(require 'cl-lib)

(let* ((packages '(js2-mode
                   haskell-mode
                   pig-mode
                   php-mode
                   yaml-mode
                   coffee-mode
                   go-mode
                   yasnippet
                   color-theme
                   dropdown-list
                   paredit
                   multiple-cursors
                   google-c-style
                   auto-complete
                   projectile
                   grizzl
                   jade-mode
                   stylus-mode
                   markdown-mode
                   scala-mode
                   sws-mode
                   editorconfig
                   expand-region
                   web-mode))
       (uninstalled-packages (cl-remove-if 'package-installed-p packages)))

  (when (> (length uninstalled-packages) 0)
    (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                             ("marmalade" . "http://marmalade-repo.org/packages/")
                             ("melpa" . "http://melpa.milkbox.net/packages/")))

    (package-refresh-contents)

    (mapcar 'package-install uninstalled-packages)))
