{% extends '//lib/c++/17/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/20/ver.sh' %}
{% endblock %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}
