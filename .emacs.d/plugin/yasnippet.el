(require 'yasnippet)

(yas/global-mode 1)
(setq yas/prompt-functions
      '(yas/dropdown-prompt
        yas/completing-prompt))
