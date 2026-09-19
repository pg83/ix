{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libmikmod
{% endblock %}

{% block version %}
3.3.14
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/mikmod/libmikmod/{{self.version().strip()}}/libmikmod-{{self.version().strip()}}.tar.gz
dffd82b8f254c3489c32098da831f33eac7136843d1e7ccb802f1254ad5b4219
{% endblock %}

{% block lib_deps %}
lib/c
{% if darwin %}
lib/darwin/framework/CoreAudio
{% endif %}
{% endblock %}
