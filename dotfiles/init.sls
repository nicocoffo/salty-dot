{{ salt['pillar.get']('user:path') }}/.dotfiles:
  file.symlink:
    - target: {{ opts['file_roots']['base'][0] }}/dotfiles/files
    - user: {{ salt['pillar.get']('user:name') }}
    - group: staff
