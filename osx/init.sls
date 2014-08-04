salt://osx/files/osx-defaults.sh:
  cmd.script

{{ salt['pillar.get']('user:path') }}/.hushlogin:
  file.managed:
    - source: salt://osx/files/.hushlogin
    - user: {{ salt['pillar.get']('user:name') }}
    - group: staff
