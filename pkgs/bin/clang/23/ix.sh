{% extends '//bin/clang/20/ix.sh' %}

{% block clang_major_version %}
23
{% endblock %}

{% block fetch %}
{% include '//lib/llvm/23/ver.sh' %}
{% endblock %}
