{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/rakshasa/rtorrent/archive/refs/tags/v0.15.2.tar.gz
sha:17458249803042fdc21f9792ab670c49080466e3f0e045e1bca46c9f1def7701
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/curl
lib/curses
lib/torrent/rtorrent
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block autoreconf %}
{{super()}}
sed -e 's|.*PKG_CHECK_EXISTS.*||' -i configure
{% endblock %}
