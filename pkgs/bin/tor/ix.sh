{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
tor
{% endblock %}

{% block version %}
0.4.9.14
{% endblock %}

{% block fetch %}
https://deb.debian.org/debian/pool/main/t/tor/tor_{{self.version().strip()}}.orig.tar.gz
182449ac1c8ff43278da27b69b02040e11d03d0327db6d9126e4190ec6235e4a
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/cap
lib/zstd
lib/event
lib/seccomp
lib/bsd/overlay
{% endblock %}

{% block configure_flags %}
--enable-lzma
--enable-zstd
--disable-asciidoc
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="${CFLAGS} -UNDEBUG"
{% endblock %}
