{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Kistler-Group/sdbus-cpp/archive/refs/tags/v1.6.0.tar.gz
sha:7ec8a2565bfc8f975c7ee528cb292021063ed793d6864c1c8733ca10ff906164
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/basu
{% endblock %}
