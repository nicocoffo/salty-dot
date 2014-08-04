brew-cask:
  pkg.installed:
    - taps:
      - 'caskroom/cask'

tap-brew-cask:
  cmd.wait:
    - name: 'brew tap caskroom/versions'
    - user: {{ salt['pillar.get']('user:name') }}
    - watch:
      - pkg: brew-cask

{% for app in salt['pillar.get']('cask') %}
{{ app }}:
  cmd.run:
    - name: brew cask install {{ app }}  2> /dev/null
    - unless: brew cask list | grep {{ app }}
    - user: {{ salt['pillar.get']('user:name') }}
    - require:
      - cmd: tap-brew-cask
    - env:
      - HOMEBREW_CASK_OPTS: --appdir=/Applications
{% endfor %}
