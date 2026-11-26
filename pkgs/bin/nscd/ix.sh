{% extends '//die/c/make.sh' %}

{% block pkg_name %}
musl-nscd
{% endblock %}

{% block version %}
1.2.1
{% endblock %}

{% block fetch %}
https://github.com/pikhq/musl-nscd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b1ab05fa29488df461258c789d015ee35557046fb761f5c21200ab7229c38519
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block configure %}
sh ./configure --prefix=${out}
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block build %}
mkdir -p obj/src
{{super()}}
{% endblock %}
