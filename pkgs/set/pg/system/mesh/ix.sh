{% extends '//etc/services/runit/script/ix.sh' %}

{% set srv_dir = 'mesh' %}
{% set srv_user = 'root' %}
{% set srv_deps = 'bin/mesh' %}

{% block run_deps %}
bin/mesh
bin/runsrv
{% endblock %}

{% block srv_command %}
if [ -d /sys/class/net/mesh0 ]; then
    ip -f inet addr flush dev mesh0
fi
exec mesh run -c ${out}/etc/mesh/config.json -key-file /home/pg/.ssh/{{pg_host or 'home'}}.key
{% endblock %}

{% block install %}
{{super()}}
mkdir -p ${out}/etc/mesh
cat << 'EOF' > ${out}/etc/mesh/config.json
{% include 'config.json' %}
EOF
{% endblock %}
