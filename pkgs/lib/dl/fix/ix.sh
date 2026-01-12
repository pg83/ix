{% extends '//die/dl/fix.sh' %}

{% block lib_deps %}
{{dl_for}}
{% endblock %}

{% block export_symbols %}
{{dl_symbols}}
{% endblock %}

{% block export_lib %}
{{dl_lib}}
{% endblock %}
