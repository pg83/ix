{# the pure wasm decoders, for a host-side `ix run`: the modules carry
   their target here, so the realm around them stays a host realm #}

{% extends '//die/hub.sh' %}

{% block run_deps %}
lib/image/magick/wasm(target=wasm32-none,kind=lib)
{% endblock %}
