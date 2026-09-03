{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
enchant
{% endblock %}

{% block version %}
2.8.21
{% endblock %}

{% block fetch %}
https://github.com/rrthomas/enchant/releases/download/v{{self.version().strip()}}/enchant-{{self.version().strip()}}.tar.gz
dd2a762697c463148a8f59867089a5ebf2dd1449d869f93764b76c12bcf8acc0
{% endblock %}

{% block conf_ver %}
2/72
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}

{% block c_rename_symbol %}
rawmemchr
{% endblock %}

{% block bld_tool %}
bld/fake(tool_name=groff)
{% endblock %}

{% block configure_flags %}
--enable-relocatable
{% endblock %}

{% block install %}
mkdir -p ${out}/lib/enchant-2
{{super()}}
{% endblock %}
