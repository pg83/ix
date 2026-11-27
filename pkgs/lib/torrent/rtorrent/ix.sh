{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libtorrent
{% endblock %}

{% block version %}
0.16.29
{% endblock %}

{% block fetch %}
https://github.com/rakshasa/libtorrent/archive/refs/tags/v{{self.version().strip()}}.tar.gz
768beab0a37cf7a608bea4b5a73d07bc27e4f7e1429c566987680e5a8ca4bf43
{% endblock %}

{% block patch %}
sed -e 's|std::distance(log_groups.begin(), this)|std::distance(log_groups.data(), this)|g' -i src/torrent/utils/log.cc
sed -e 's|std::string_view(first, last - first)|std::string_view(\&*first, last - first)|' -i src/torrent/utils/string_manip.cc
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/curl
lib/openssl
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}
