(load-file "~/.emacs.d/install.el")

;; load plugin settings
(mapcar 'load-file (directory-files "~/.emacs.d/plugin/" t "\\.el$"))

(load-file "~/.emacs.d/settings.el")
(load-file "~/.emacs.d/key-bindings.el")

(when (file-exists-p "~/.emacs.d/local.el")
  (load-file "~/.emacs.d/local.el"))

;; fullscreen on start
(toggle-frame-fullscreen)
