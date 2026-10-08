{# DjVuLibre's library on the sandbox: the library itself is
   lib/djvulibre/wasi/impl, built against the shims it needs; whoever
   links it links what it links, the pthread shim's thread model among
   them #}

{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/c
lib/c++
lib/jpeg
lib/shim/pthread
lib/djvulibre/wasi/impl
{% endblock %}
