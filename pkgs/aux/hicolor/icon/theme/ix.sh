{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://icon-theme.freedesktop.org/releases/hicolor-icon-theme-0.17.tar.xz
sha:317484352271d18cbbcfac3868eab798d67fff1b8402e740baa6ff41d588a9d8
{% endblock %}

{% block run_data %}
{{super()}}
{% if target_realm %}
aux/hicolor/icon/fix
{% endif %}
{% endblock %}
