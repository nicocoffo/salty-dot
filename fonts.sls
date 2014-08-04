pull-fonts:
  git.latest:
    - name: https://github.com/Lokaltog/powerline-fonts.git
    - target: {{ salt['pillar.get']('user:path') }}/.salty-dot/.local/fonts
    - unless: ls {{ salt['pillar.get']('user:path') }}/Library/Fonts | grep 'Sauce Code Powerline Regular.otf'
    - user: {{ salt['pillar.get']('user:name') }}

copy-fonts:
  file.recurse:
    - name: {{ salt['pillar.get']('user:path') }}/Library/Fonts
    - source: salt://.local/fonts/SourceCodePro
    - include_pat: '*.otf'
    - user: {{ salt['pillar.get']('user:name') }}
    - group: staff
    - require_in:
      - cmd: iterm2
    - require:
      - git: pull-fonts