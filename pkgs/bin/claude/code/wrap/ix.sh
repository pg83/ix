{% extends '//die/hub.sh' %}

{% block pkg_name %}
claude
{% endblock %}

{% block run_deps %}
bin/wrap
bin/claude/code
bin/claude/code/wrap/scripts
{% endblock %}
