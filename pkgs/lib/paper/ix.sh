{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libpaper
{% endblock %}

{% block version %}
2.3.0
{% endblock %}

{% block fetch %}
https://github.com/rrthomas/libpaper/releases/download/v{{self.version().strip()}}/libpaper-{{self.version().strip()}}.tar.gz
882b1c7636052fc9a318caa20292b35616b588824b70e7053018262b29b1409a
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
