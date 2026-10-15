{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fast_float
{% endblock %}

{% block version %}
8.3.2
{% endblock %}

{% block fetch %}
https://github.com/fastfloat/fast_float/archive/refs/tags/v{{self.version().strip()}}.tar.gz
71bb9e865b888df01351558db5a39586d13ea97ada162156b3a07784d8c1b26b
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/share ${out}/lib
{% endblock %}
