iterm2-config:
  cmd.wait:
    - name: defaults write com.googlecode.iterm2 PrefsCustomFolder -string '/Users/{{ pillar['username'] }}/.dotfiles/iterm2'; defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
    - user: {{ pillar['username'] }}
    - watch:
      - cmd: iterm2
