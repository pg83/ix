{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv
bin/dropbear
{% if not dropbear_keys %}
etc/host/keys
{% endif %}
bin/dropbear/runit/scripts
{% endblock %}
