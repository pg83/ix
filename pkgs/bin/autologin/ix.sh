{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv
bin/fixtty
bin/subreaper
bin/autologin/runit
{% endblock %}
