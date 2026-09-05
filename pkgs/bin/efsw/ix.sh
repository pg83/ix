{% extends '//die/c/premake.sh' %}

{% block pkg_name %}
efsw
{% endblock %}

{% block version %}
1.7.2
{% endblock %}

{% block fetch %}
https://github.com/SpartanJ/efsw/archive/refs/tags/{{self.version().strip()}}.tar.gz
ccb91ea041223dc58513726ff8156eaa0190f75215dc00d7cba2daf3cd900173
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block make_flags %}
-C make/linux
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cpp_missing %}
sys/select.h
{% endblock %}

{% block setup_target_flags %}
export CPPFLAGS="-Du_int32_t=uint32_t ${CPPFLAGS}"
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp bin/efsw-test-debug ${out}/bin/efsw
{% endblock %}
