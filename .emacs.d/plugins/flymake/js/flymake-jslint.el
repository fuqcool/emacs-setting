(defcustom jslint-command "jslint"
  "where jslint locates"
  :type 'string
  :group 'jslint)

(when (load "flymake" t)
  (defun flymake-jslint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list jslint-command (list local-file))))

  ;; (setq flymake-err-line-patterns 
  ;;       (cons '("^  [[:digit:]]+ \\([[:digit:]]+\\),\\([[:digit:]]+\\): \\(.+\\)$"  
  ;;       	nil 1 2 3)
  ;;             flymake-err-line-patterns))

  (setq flymake-err-line-patterns
        (cons '("^[[:space:]]+#[[:digit:]]+ \\(.+\\)I BLAME BOTH FLYMAKE AND JSLINT.+// Line \\([[:digit:]]+\\), Pos \\([[:digit:]]+\\)$" nil 2 3 1)
              flymake-err-line-patterns))
  
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.js\\'" flymake-jslint-init)))

(provide 'flymake-jslint)