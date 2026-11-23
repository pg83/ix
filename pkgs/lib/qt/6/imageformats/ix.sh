{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qtimageformats
{% endblock %}

{% block version %}
6.12.1
{% endblock %}

{% block fetch %}
https://github.com/qt/qtimageformats/archive/refs/tags/v{{self.version().strip()}}.tar.gz
bc041157458b4e34428bac6ad52feffd3b3e6d968ceaf64479174ae3cac66018
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/webp
lib/tiff
lib/jasper
lib/qt/6/base
{% endblock %}
