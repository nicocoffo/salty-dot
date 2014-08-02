salt://osx/files/osx-defaults.sh:
  cmd.script

/Users/{{ pillar['username'] }}/.hushlogin:
  file.managed:
    - source: salt://osx/files/.hushlogin
    - user: {{ pillar['username'] }}
    - group: staff
