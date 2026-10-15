{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
rtorrent
{% endblock %}

{% block version %}
0.16.25
{% endblock %}

{% block fetch %}
https://github.com/rakshasa/rtorrent/archive/refs/tags/v{{self.version().strip()}}.tar.gz
21a284a96de11eb9cc52cab6982601de1d475596faf256ee6d9ed0b01da87277
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
