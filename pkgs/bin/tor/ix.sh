{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
tor
{% endblock %}

{% block version %}
0.4.9.12
{% endblock %}

{% block fetch %}
https://dist.torproject.org/tor-{{self.version().strip()}}.tar.gz
c0d307c9dcdaee4848a8ca53e9d6c4ec92823e4f30be12790b0fbddfc6515f5b
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
