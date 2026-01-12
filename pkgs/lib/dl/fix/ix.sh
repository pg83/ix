{% extends '//die/dl/fix.sh' %}

{% block lib_deps %}
{% if dl_for %}
{{dl_for}}
{% else %}
{{super()}}
{% endif %}
{% endblock %}

{% block export_symbols %}
{{dl_symbols}}
{% endblock %}

{% block export_lib %}
{{dl_lib}}
{% endblock %}
