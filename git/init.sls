{{ salt['pillar.get']('user:path') }}/.gitconfig:
  file.symlink:
    - target: {{ opts['file_roots']['base'][0] }}/git/.gitconfig
    - user: {{ salt['pillar.get']('user:name') }}
    - group: staff
