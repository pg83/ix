{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SPIRV-Cross
{% endblock %}

{% block version %}
1.4.357.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-Cross/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
97c910326afdd44d794ce8561326fa675fd1958b27142f03295403044d639639
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/shim/fake/pkg(pkg_name=spirv-cross-c-shared,pkg_ver={{self.version().strip()}})
{% endblock %}
