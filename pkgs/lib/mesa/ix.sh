{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if mesa_driver %}
lib/gbm
lib/mesa/dl
{% endif %}
{% endblock %}
