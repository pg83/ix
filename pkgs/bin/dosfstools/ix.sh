{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
dosfstools
{% endblock %}

{% block version %}
4.2
{% endblock %}

{% block fetch %}
https://github.com/dosfstools/dosfstools/releases/download/v{{self.version().strip()}}/dosfstools-{{self.version().strip()}}.tar.gz
64926eebf90092dca21b14259a5301b7b98e7b1943e8a201c7d726084809b527
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
