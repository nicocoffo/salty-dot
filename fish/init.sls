fish-shells:
  cmd.run:
    - name: echo '/usr/local/bin/fish' | tee -a /etc/shells
    - unless: grep -q fish /etc/shells
    - require:
      - pkg: fish

fish-user:
  user.present:
    - name: {{ salt['pillar.get']('user:name') }}
    - shell: /usr/local/bin/fish
    - require:
      - cmd: fish-shells

oh-my-fish:
  cmd.run:
    - name: 'curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish'
    - unless: ls {{ salt['pillar.get']('user:path') }}/.oh-my-fish/oh-my-fish.fish
    - user: {{ salt['pillar.get']('user:name') }}
    - require:
      - pkg: fish

{{ salt['pillar.get']('user:path') }}/.config/fish/config.fish:
  file.managed:
    - source: salt://fish/config.fish
    - user: {{ salt['pillar.get']('user:name') }}
    - group: staff
    - mode: 644
    - makedirs: True
    - dir_mode: 755
    - require:
      - cmd: oh-my-fish
