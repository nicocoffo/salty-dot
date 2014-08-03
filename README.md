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
- Use user.home in pillar
- Use os in pillar
- Setup emacs for c
- Add tmux conf
- Actually test this on a fresh machine
- Fix up OSX changes (three finger drag, dock)
- Add some documentation for new functions
- Calls to google drive to get licenses + private thingys
  - Open pupil license

Sources
-------
- OSX stuff - https://github.com/mathiasbynens/dotfiles
- Fish stuff - https://github.com/bpinto/oh-my-fish
- Font stuff - https://github.com/Lokaltog/powerline-fonts
- Emacs stuff - https://github.com/Errorific/dotfiles
