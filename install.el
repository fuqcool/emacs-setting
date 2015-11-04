(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-refresh-contents)
(package-initialize)

(mapcar (lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
        '(haskell-mode
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
          sws-mode))
