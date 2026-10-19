{% extends '//die/c/meson.sh' %}

# noauto

{% block pkg_name %}
libsigc++
{% endblock %}

{% block version %}
3.6.0
{% endblock %}

{% block fetch %}
https://github.com/libsigcplusplus/libsigcplusplus/releases/download/{{self.version().strip()}}/libsigc%2B%2B-{{self.version().strip()}}.tar.xz
c3d23b37dfd6e39f2e09f091b77b1541fbfa17c4f0b6bf5c89baef7229080e17
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
