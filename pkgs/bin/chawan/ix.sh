{% extends '//die/nim/base.sh' %}

{% block pkg_name %}chawan{% endblock %}
{% block version %}0.4.4{% endblock %}

{% block fetch %}
https://git.sr.ht/~bptato/chawan/archive/v{{self.version().strip()}}.tar.gz
e0a06e1504e10a51c6009751d79b798c98d8274e559fe195d4b4b7ddadf91bb8
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
sed -e 's|$(NIMC) -o:$@ $<|$(NIMH) -o:$@ $<|' -i Makefile
{% endblock %}

{% block build %}
make -j${make_thrs} NIMC=nimcc NIMH=nimhost STATIC_LINK=1
{% endblock %}

{% block install %}
make install PREFIX=${out}
{% endblock %}
