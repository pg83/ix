{# libheif on the sandbox: the library itself is lib/heif/wasi/impl, built
   against the shims it needs; whoever links it links what it links #}

{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/c
lib/c++
lib/aom
lib/heif/wasi/impl
{% endblock %}
