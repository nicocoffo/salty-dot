/Users/{{ pillar['username'] }}/.gitconfig:
  file.symlink:
    - target: {{ opts['file_roots']['base'][0] }}/git/.gitconfig
    - user: {{ pillar['username'] }}
    - group: staff
