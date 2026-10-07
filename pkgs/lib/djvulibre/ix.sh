{# DjVuLibre's library, by platform: the sandbox's single-threaded,
   exception-free one on wasi, the plain one elsewhere #}

{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if wasi %}
lib/djvulibre/wasi
{% else %}
lib/djvulibre/common
{% endif %}
{% endblock %}
