{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if not isfile('/bin/fetcher') %}
bin/curl
bld/python
bld/fetch/bootstrap
{% endif %}
bld/fetch/scripts
{% endblock %}
