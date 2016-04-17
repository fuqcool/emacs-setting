(projectile-global-mode)

(setq projectile-completion-system 'grizzl)

;; Shortcuts
(global-set-key (kbd "C-c p p") 'projectile-switch-project)
(global-set-key (kbd "C-c p s") 'projectile-switch-project)
(global-set-key (kbd "C-c p f") 'projectile-find-file)
