pull-fonts:
  git.latest:
    - name: https://github.com/Lokaltog/powerline-fonts.git
    - target: /Users/{{ pillar['username'] }}/.salty-dot/.local/fonts
    - unless: ls /Users/{{ pillar['username'] }}/Library/Fonts | grep 'Sauce Code Powerline Regular.otf'
    - user: {{ pillar['username'] }}

copy-fonts:
  file.recurse:
    - name: /Users/{{ pillar['username'] }}/Library/Fonts
    - source: salt://.local/fonts/SourceCodePro
    - include_pat: '*.otf'
    - user: {{ pillar['username'] }}
    - group: staff
    - require_in:
      - cmd: iterm2
    - require:
      - git: pull-fonts