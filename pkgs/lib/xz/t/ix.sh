{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
xz
{% endblock %}

{% block version %}
5.8.4
{% endblock %}

{% block fetch %}
https://github.com/tukaani-project/xz/releases/download/v{{self.version().strip()}}/xz-{{self.version().strip()}}.tar.gz
0014c7886930454fe8bd4228665b51af55eeae560ea135c9c4cd33f55b2591d9
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block std_box %}
{% if mingw32 %}
bin/slibtool
{% endif %}
{{super()}}
{% endblock %}

{% block configure_flags %}
{% if wasi %}
--enable-threads=no
{% endif %}
{% endblock %}
