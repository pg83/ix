{% extends '//die/c/make.sh' %}

{% block pkg_name %}
unrar
{% endblock %}

{% block version %}
7.3.1
{% endblock %}

{% block fetch %}
https://www.rarlab.com/rar/unrarsrc-{{self.version().strip()}}.tar.gz
634900842a3737d9cc15bbcc71d4c74cc713437e0bca296a573424fe5f2660ab
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block make_flags %}
-f makefile
CXXFLAGS=
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp unrar ${out}/bin/
{% endblock %}
