{% extends '//die/hub.sh' %}

{% block ind_deps %}
bin/clang/lib
{% endblock %}

{% block run_deps %}
bin/clang/18/bootstrapped
{% endblock %}
