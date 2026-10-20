{% extends '//lib/gperftools/16/ix.sh' %}

{% block version %}
2.19
{% endblock %}

{% block fetch %}
https://github.com/gperftools/gperftools/releases/download/gperftools-{{self.version().strip()}}/gperftools-{{self.version().strip()}}.tar.gz
97adc4509128200e21f3b29cd0f1184d4a41cfad892750cd15e6b8f5b5f96f21
{% endblock %}

{% block lib_deps %}
lib/tcmalloc/headers
lib/c++/dispatch
lib/reallocarray/impl
lib/build/w/include/next
{% endblock %}
