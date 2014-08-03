(setq-default c-basic-offset 2)
(setq-default c-default-style "linux")
(add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state 1)))

(add-to-list 'load-path "~/.emacs.d/vendor/powerline")
(require 'powerline)
(powerline-evil-theme)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (base16-terminal)))
 '(custom-safe-themes (quote ("78e1b4320e7947da11454ea8662212ddbb3ebbd496ff13fb55f7c0da2aa773c7" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
