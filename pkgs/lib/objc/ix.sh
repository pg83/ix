{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if darwin %}
# use system objc runtime
lib/darwin/c
{% else %}
lib/objc/2
{% endif %}
{% endblock %}
