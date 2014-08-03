cask:
  pkg.installed

emacs-confs:
  file.symlink:
    - name: /Users/{{ pillar['username'] }}/.emacs.d
    - target: {{ opts['file_roots']['base'][0] }}/emacs/files
    - user: {{ pillar['username'] }}
    - group: staff

cask install:
  cmd.run:
    - user: {{ pillar['username'] }}
    - cwd: /Users/{{ pillar['username'] }}/.emacs.d
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