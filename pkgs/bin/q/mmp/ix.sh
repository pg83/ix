{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
qmmp
{% endblock %}

{% block version %}
2.4.2
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/qmmp-dev/qmmp/{{self.version().strip()[:3]}}/qmmp-{{self.version().strip()}}.tar.bz2
8042f83a9ed810e170f7127e6eb53c6b29038dbf504a01c0867c19e5fd200e7d
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/deps
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
{% endblock %}
