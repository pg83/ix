{% extends '//die/hub.sh' %}

{% block ya_git_commit %}
d4e46645fe1f35d5406bc096e373db1d72201231
{% endblock %}

{% block ya_git_sha %}
qw
{% endblock %}

{% block run_deps %}
bin/ya/wrapper
bin/ya/final/unwrap(ya_boot_tc=bin/ya/final/0,ya_git_commit={{self.ya_git_commit().strip()}},ya_git_sha={{self.ya_git_sha().strip()}})
{% endblock %}
