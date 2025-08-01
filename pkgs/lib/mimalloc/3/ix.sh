{% extends '//lib/mimalloc/2/ix.sh' %}

{% block pkg_name %}
mimalloc
{% endblock %}

{% block version %}
3.0.1
{% endblock %}

{% block fetch %}
https://github.com/microsoft/mimalloc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6a514ae31254b43e06e2a89fe1cbc9c447fdbf26edc6f794f3eb722f36e28261
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/mimalloc-3.0 \${CPPFLAGS}"
export ac_cv_func_malloc_0_nonnull=yes
export ac_cv_func_realloc_0_nonnull=yes
{% endblock %}
