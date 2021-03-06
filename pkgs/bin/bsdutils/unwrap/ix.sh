{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/dcantrell/bsdutils/archive/refs/tags/v13.0-beta1.tar.gz
sha:08970d5511c8dd34b69991ce8d88f5b29708b376bf9bbed42c8bf081c0c3a12e
{% endblock %}

{% block bld_libs %}
lib/c
lib/xo
lib/c++
lib/edit
lib/curses
lib/openssl

{% if linux %}
lib/fts
lib/linux
lib/rpmatch
{% endif %}
{% endblock %}

{% block bld_tool %}
bld/flex
bld/byacc
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv sbin/* bin/
rm -r sbin
{% endblock %}
