{% extends '//die/proxy.sh' %}

{% block run_deps %}
# TODO(pg): move to upper level
bin/runsrv
bin/busybox
{% endblock %}

{% block install %}
cd ${out}; mkdir -p etc/services/syslogd; cd etc/services/syslogd

cat << EOF > run
#!/bin/sh
exec srv syslogd syslogd -n -O /var/log/syslog
EOF

chmod +x run
{% endblock %}
