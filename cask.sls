brew-cask:
  pkg.installed:
    - taps:
      - 'caskroom/cask'

tap-brew-cask:
  cmd.wait:
    - name: 'brew tap caskroom/versions'
    - user: {{ pillar['username'] }}
    - watch:
      - pkg: brew-cask

{% for app in pillar['cask'] %}
{{ app }}:
  cmd.run:
    - name: brew cask install {{ app }}  2> /dev/null
    - unless: brew cask list | grep {{ app }}
    - user: {{ pillar['username'] }}
    - require:
      - cmd: tap-brew-cask
    - env:
      - HOMEBREW_CASK_OPTS: --appdir=/Applications 
{% endfor %}

alfred-link:
  cmd.run:
    - name: 'brew cask alfred link'
    - unless: 'brew cask alfred status | grep happily'
    - user: {{ pillar['username'] }}
    - require:
      - cmd: alfred
