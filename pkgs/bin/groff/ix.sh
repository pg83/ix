{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
groff
{% endblock %}

{% block version %}
1.23.0
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/groff/groff-{{self.version().strip()}}.tar.gz
6b9757f592b7518b4902eb6af7e54570bdccba37a871fddb2d30ae3863511c13
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/uchardet
{% endblock %}

{% block bld_tool %}
bld/perl
bld/bison
bld/texinfo
{% endblock %}

{% block patch %}
>src/libs/libgroff/new.cpp
{% endblock %}

{% block configure_flags %}
--with-uchardet=yes
{% endblock %}

{% block c_flags %}
-Wno-register
{% endblock %}
