;; shortcuts

;; f1 -> shell
(global-set-key [f1] 'shell)

;; f12 -> open .emacs
(global-set-key [f2] (lambda ()
                        (interactive)
                        (find-file "~/.emacs")))

;; Go to beginning of text first, then go to beginning of line
(global-set-key "\C-a"
                (lambda ()
                  (interactive)
                  (let ((current-pos (point)))
                    (back-to-indentation)
                    (if (= current-pos (point))
                        (beginning-of-line)))))

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

;; move line up
(global-set-key "\M-p"
                (lambda ()
                  (interactive)
                  (when (not (= (line-number-at-pos) 1))
                    (transpose-lines 1)
                    (forward-line -2))))

;; move line down
(global-set-key "\M-n"
                (lambda ()
                  (interactive)
                  (forward-line 1)
                  (transpose-lines 1)
                  (forward-line -1)))

;; disable this
(global-set-key "\C-z" 'undo)
