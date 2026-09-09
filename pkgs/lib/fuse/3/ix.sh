{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libfuse
{% endblock %}

{% block version %}
3.18.3
{% endblock %}

{% block fetch %}
https://github.com/libfuse/libfuse/archive/refs/tags/fuse-{{self.version().strip()}}.tar.gz
a26f46edc8db4e2cbf1b46d36d3e18ea208871671e56434d9ceb8f7887a690d2
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block meson_flags %}
utils=false
useroot=false
{% endblock %}

{% block patch %}
sed -e 's|__off64_t|off_t|' -i include/fuse_lowlevel.h
{% endblock %}
