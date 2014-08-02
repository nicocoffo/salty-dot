/Users/{{ pillar['username'] }}/Library/Fonts:
  file.recurse:
    - source: salt://fonts/fonts
    - user: {{ pillar['username'] }}
    - group: staff
    - require_in:
      - cmd: iterm2
