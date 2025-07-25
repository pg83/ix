{% extends '//die/c/make.sh' %}

{% block version %}
6
{% endblock %}

{% block pkg_name %}
9base
{% endblock %}

{% block fetch %}
https://dl.suckless.org/tools/9base-{{self.version().strip()}}.tar.gz
2997480eb5b4cf3092c0896483cd2de625158bf51c501aea2dc5cf74176d6de9
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block patch %}
sed -e 's|mygetdents(fd|getdents(fd|' -i lib9/dirread.c
{% endblock %}

{% block c_flags %}
-fcommon
-Wno-implicit-function-declaration
{% endblock %}
