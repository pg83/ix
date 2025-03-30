{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/patch/patch-2.8.tar.xz
sha:f87cee69eec2b4fcbf60a396b030ad6aa3415f192aa5f7ee84cad5e11f7f5ae3
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block std_box %}
bld/bison
{{super()}}
{% endblock %}
