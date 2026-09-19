{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libdispatch
{% endblock %}

{% block version %}
6.3.3
{% endblock %}

{% block fetch %}
https://github.com/apple/swift-corelibs-libdispatch/archive/refs/tags/swift-{{self.version().strip()}}-RELEASE.tar.gz
c3a61c08387937622a291e08e64eb4ec0be07f1df252574552641129057951bb
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/bsd
{% endblock %}

{% block bld_libs %}
lib/kernel
lib/bsd/overlay
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block patch %}
cat << EOF >> os/generic_unix_base.h
#pragma once

#if defined(__cplusplus)
    #define __BEGIN_DECLS extern "C" {
    #define __END_DECLS }
#else
    #define __BEGIN_DECLS
    #define __END_DECLS
#endif
EOF
{% endblock %}
