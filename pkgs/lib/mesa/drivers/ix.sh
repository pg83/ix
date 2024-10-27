{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if mesa_driver %}
lib/mesa/egl
lib/mesa/drivers/{{mesa_driver}}
{% else %}
lib/mesa/drivers/fake
{% endif %}
{% endblock %}
