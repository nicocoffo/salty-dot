cask:
  pkg.installed

emacs-confs:
  file.symlink:
    - name: {{ salt['pillar.get']('user:path') }}/.emacs.d
    - target: {{ opts['file_roots']['base'][0] }}/emacs/files
    - user: {{ salt['pillar.get']('user:name') }}
    - group: staff

cask install:
  cmd.run:
    - user: {{ salt['pillar.get']('user:name') }}
    - cwd: {{ salt['pillar.get']('user:path') }}/.emacs.d
    - require:
      - file: emacs-confs
      - pkg: cask

/Library/LaunchAgents/gnu.emacs.daemon.plist:
  file.managed:
    - source: salt://emacs/gnu.emacs.daemon.plist
  service:
    - running
    - enable: True
    - reload: True
    - watch:
      - file: /Library/LaunchAgents/gnu.emacs.daemon.plist