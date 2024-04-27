{% extends '//bin/alsa/utils/t/ix.sh' %}

{% block bld_libs %}
lib/c
lib/alsa
lib/udev
lib/intl
lib/curses
lib/samplerate
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-curses=ncurses
{% endblock %}
