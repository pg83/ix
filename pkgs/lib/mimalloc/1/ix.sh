{% extends '//lib/mimalloc/2/ix.sh' %}

{% block pkg_name %}
mimalloc
{% endblock %}

{% block version %}
1.15.4
{% endblock %}

{% block fetch %}
https://github.com/microsoft/mimalloc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
82c5ee87d95d74fd7447a02884d351ca77eb789d2280278aeb8e632a57f430c7
{% endblock %}

{% block bld_libs %}
lib/c/naked
{% endblock %}

{% block cmake_flags %}
{{super()}}
MI_USE_CXX=OFF
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/mimalloc-1.7 \${CPPFLAGS}"
export ac_cv_func_malloc_0_nonnull=yes
export ac_cv_func_realloc_0_nonnull=yes
{% endblock %}
