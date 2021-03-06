{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/akheron/jansson/archive/refs/tags/v2.14.tar.gz
md5:bc78f39c7cd7fab1dd5fc4a2c3be1661
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
USE_WINDOWS_CRYPTOAPI=OFF
JANSSON_EXAMPLES=OFF
JANSSON_BUILD_DOCS=OFF
JANSSON_WITHOUT_TESTS=ON
{% endblock %}
