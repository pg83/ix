{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/gdb
bin/perf
bin/htop
bin/iotop
bin/strace
bin/fswatch
bin/valgrind
{% endblock %}
