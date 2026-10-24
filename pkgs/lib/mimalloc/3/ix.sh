{% extends '//lib/mimalloc/2/ix.sh' %}

{% block pkg_name %}
mimalloc
{% endblock %}

{% block version %}
3.6.0
{% endblock %}

{% block fetch %}
https://github.com/microsoft/mimalloc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
c663101ba193b5b823c8541c1b719ab67e3ebf9976e425a02359a5cad5e52990
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/mimalloc-3.0 \${CPPFLAGS}"
export ac_cv_func_malloc_0_nonnull=yes
export ac_cv_func_realloc_0_nonnull=yes
{% endblock %}
