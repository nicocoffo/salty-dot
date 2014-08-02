/Users/{{ pillar['username'] }}/.gitconfig:
  file.managed:
    - source: salt://git/.gitconfig
    - user: {{ pillar['username'] }}
    - group: staff
    - mode: 644
