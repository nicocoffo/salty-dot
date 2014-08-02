/Users/{{ pillar['username'] }}/.dotfiles:
  file.symlink:
    - target: {{ opts['file_roots']['base'][0] }}/dotfiles/files
    - user: {{ pillar['username'] }}
    - group: staff
