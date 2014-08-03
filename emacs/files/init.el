;; Emacs 24 init.el

;; NOTE: The name of the Org files is important! When a file gets tangled,
;; it gets the same base name as the Org file. Thus, tangling Emacs Lisp from
;; a file `init.org` would generate `init.el`, obliterating this file in the
;; process. So your config org file should not be named "init.org".

;; Initialize cask to get the correct version of org-mode
(require 'cask "/usr/local/Cellar/cask/0.7.0/cask.el")
(cask-initialize)

(require 'ob-tangle)
(setq debug-on-error nil)
(setq vc-follow-symlinks t)
(org-babel-load-file
  (expand-file-name "emacs-init.org"
                    user-emacs-directory))
