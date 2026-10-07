{# libmagic, by platform: the sandbox's variant on wasi, the plain one
   elsewhere #}

{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if wasi %}
lib/magic/wasi
{% else %}
lib/magic/common
{% endif %}
{% endblock %}
