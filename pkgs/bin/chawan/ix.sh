{% extends '//die/nim/base.sh' %}

{% block pkg_name %}chawan{% endblock %}
{% block version %}
0.5.0
{% endblock %}

{% block fetch %}
https://git.sr.ht/~bptato/chawan/archive/v{{self.version().strip()}}.tar.gz
031d1ef809e1e94f16815c543a450f62a3577a7b7240ac02160dd8c78512f588
{% endblock %}

{% block bld_tool %}
bld/make
bld/pkg/config
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/openssl
lib/brotli
lib/ssh/2/openssl
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block patch %}
sed -e '/chac_cache/s|$(NIMC)|$(NIMH)|' -i Makefile
{% endblock %}

{% block build %}
make -j${make_thrs} NIMC=nimcc NIMH=nimhost STATIC_LINK=1
{% endblock %}

{% block install %}
make install PREFIX=${out}
{% endblock %}
