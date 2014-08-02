fish-shells:
  cmd.run:
    - name: echo '/usr/local/bin/fish' | tee -a /etc/shells
    - unless: grep -q fish /etc/shells
    - require:
      - pkg: fish

fish-user:
  user.present:
    - name: {{ pillar['username'] }}
    - shell: /usr/local/bin/fish
    - require:
      - cmd: fish-shells

oh-my-fish:
  cmd.run:
    - name: 'curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish'
    - unless: ls /Users/{{ pillar['username'] }}/.oh-my-fish/oh-my-fish.fish
    - user: {{ pillar['username'] }}
    - require:
      - pkg: fish

/Users/{{ pillar['username'] }}/.config/fish/config.fish:
  file.managed:
    - source: salt://fish/config.fish
    - user: {{ pillar['username'] }}
    - group: staff
    - mode: 644
    - makedirs: True
    - dir_mode: 755 
    - require:
      - cmd: oh-my-fish
