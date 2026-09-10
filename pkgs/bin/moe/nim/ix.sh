{% extends '//die/nim/build.sh' %}

{% block pkg_name %}
moe
{% endblock %}

{% block version %}
0.4.0
{% endblock %}

{% block nim_url %}
https://github.com/fox0430/moe/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block nim_src_sha %}
2bb3f24a219b9538647193be063019a9c22038bd483de57333dbb16c83b17b3d
{% endblock %}

{% block nim_sha %}
72ab0ddc0e1c6d2fd288071e9c312a29a42ad346e9d433df7473905c38297035
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

{% block nim_bin %}moe{% endblock %}
{% block nim_main %}src/moe.nim{% endblock %}

{% block patch %}
base64 -d << EOF | patch -p1
{% include 'static-curses.patch/base64' %}
EOF
{% endblock %}

{% block nim_flags %}
{{super()}}
--dynlibOverrideAll
{% endblock %}
