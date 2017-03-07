(projectile-global-mode)

(setq projectile-completion-system 'grizzl)

(define-key projectile-mode-map (kbd "C-c p d") 'projectile-find-file-in-directory)
