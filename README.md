salty-dot
=========
OSX configuration using masterless saltstack. Username and package variables are in pillars. Plan is to symlink dotfiles, preferably though the ~/.dotfiles directory.

Install script requires git and will end up installing brew and saltstack if not already present.

Install using:
```bash
curl https://raw.githubusercontent.com/nicocoffo/salty-dot/master/install.sh | bash
```

This repo will be cloned into ~/.salty-dot and salt will do its thing. The install script can be run again to update or apply changes that aren't symlinked.

TODO
----
- Actaully test this on a fresh machine
- Add emacs conf
- Buy + Add alfred conf
- Add tmux conf
- Add git commands (gca, gp, ...)
- Fix up OSX changes (three finger drag, dock)
- Add some documentation for new functions
- Private stuff from google drive? Google auth?

After Install
-------------
- Run pupil + apply license

Sources
-------
- OSX stuff - https://github.com/mathiasbynens/dotfiles
- Fish stuff - https://github.com/bpinto/oh-my-fish
- Font stuff - https://github.com/Lokaltog/powerline-fonts
