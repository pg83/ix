{# libmagic on the sandbox: the library itself is lib/magic/wasi/impl,
   built against the shims it needs; whoever links it links what it
   links #}

{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/c
lib/magic/wasi/impl
{% endblock %}
