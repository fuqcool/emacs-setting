(defcustom jslint-command "jslint"
  "where jslint locates"
  :type 'string
  :group 'jslint)

(defvar jslint-flags nil)
(defvar jslint-command-options nil)
(defvar jslint-predefs nil)

(when (load "flymake" t)
  (defun flymake-jslint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      ;; (message (jslint-compose-options))
      (list jslint-command (list (jslint-compose-options)
                                 local-file))))

  (defun jslint-compose-options ()
    (defun compose-predefs ()
      (if jslint-predefs
          (mapconcat
           (lambda (x)
             (concat "--predef " x))
           jslint-predefs " ")
        ""))
    (defun compose-flags ()
      (if jslint-flags
          (mapconcat
           (lambda (x)
             (if (consp x)
                 (if (cdr x)
                     (concat "--" (car x))
                   (concat "--" (car x) " false"))
               (concat "--" x)))
           jslint-flags " ")
        ""))
    (defun compose-command-options ()
      (if jslint-command-options
          (mapconcat
           (lambda (x)
             (if (consp x)
                 (concat "--" (car x) " "
                         (number-to-string (cdr x)))))
           jslint-command-options " ")
        ""))
    (concat " " (compose-flags) " "
            (compose-predefs) " "
            (compose-command-options) " "))

  ;; (setq flymake-err-line-patterns 
  ;;       (cons '("^  [[:digit:]]+ \\([[:digit:]]+\\),\\([[:digit:]]+\\): \\(.+\\)$"  
  ;;       	nil 1 2 3)
  ;;             flymake-err-line-patterns))

  (setq flymake-err-line-patterns
        (cons '("^[[:space:]]+#[[:digit:]]+ \\(.+\\) // Line \\([[:digit:]]+\\), Pos \\([[:digit:]]+\\)$" nil 2 3 1)
              flymake-err-line-patterns))
  
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.js\\'" flymake-jslint-init)))

(provide 'flymake-jslint)
