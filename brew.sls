{% for app in pillar['brew'] %}
{{ app.iterkeys().next() }}:
  pkg.installed:
    - taps: {{ app.get('taps') }}
    - options: {{ app.get('options') }}
{% endfor %}
