{# libheif, by platform: the sandbox's decoder on wasi, the plain one
   elsewhere #}

{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if wasi %}
lib/heif/wasi
{% else %}
lib/heif/common
{% endif %}
{% endblock %}
