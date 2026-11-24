{% extends '//lib/mimalloc/2/ix.sh' %}

{% block pkg_name %}
mimalloc
{% endblock %}

{% block version %}
3.7.1
{% endblock %}

{% block fetch %}
https://github.com/microsoft/mimalloc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
8bc9f820eaf3dad3509d7930d80c40512bc51e04989641f892ee64c46b7ab0d8
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/mimalloc-3.0 \${CPPFLAGS}"
export ac_cv_func_malloc_0_nonnull=yes
export ac_cv_func_realloc_0_nonnull=yes
{% endblock %}
