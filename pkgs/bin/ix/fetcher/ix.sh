{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/wget
bin/curl
bin/subreaper
bin/ix/fetcher/scripts
{% endblock %}
