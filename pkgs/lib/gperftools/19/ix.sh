{% extends '//lib/gperftools/16/ix.sh' %}

{% block version %}
2.19.1
{% endblock %}

{% block fetch %}
https://github.com/gperftools/gperftools/releases/download/gperftools-{{self.version().strip()}}/gperftools-{{self.version().strip()}}.tar.gz
4b0ac7a3803868685caa0ca4c190100ad8a302af6eb10b3e7482d36367f97309
{% endblock %}

{% block lib_deps %}
lib/tcmalloc/headers
lib/c++/dispatch
lib/reallocarray/impl
lib/build/w/include/next
{% endblock %}
