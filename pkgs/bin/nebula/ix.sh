{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/nebula/cert
bin/nebula/daemon
bin/nebula/service
{% endblock %}
