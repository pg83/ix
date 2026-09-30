{# wabt for a build, wasm2c above all. Never the system's: the C wasm2c
   generates and lib/wabt/runtime have to be the same wabt #}

{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/wabt
{% endblock %}
