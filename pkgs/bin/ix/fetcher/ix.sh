{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ix/assemble
bin/ix/fetcher/scripts
{% endblock %}
