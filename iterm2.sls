iterm2-config:
  cmd.wait:
    - name: defaults write com.googlecode.iterm2 PrefsCustomFolder -string '{{ salt['pillar.get']('user:path') }}/.dotfiles/iterm2'; defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
    - user: {{ salt['pillar.get']('user:name') }}
    - watch:
      - cmd: iterm2
