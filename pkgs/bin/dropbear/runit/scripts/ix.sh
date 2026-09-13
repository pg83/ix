{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/etc/services/dropbear
cd ${out}/etc/services/dropbear

cat << EOF > run
#!/bin/sh
exec srv dropbear ${PWD}/script
EOF

cat << EOF > script
#!/bin/sh

set -xue

export TMPDIR=\${PWD}/tmp

rm -rf \${TMPDIR}
mkdir -p \${TMPDIR}
chmod 01777 \${TMPDIR}

exec /bin/dropbear \
{% for key in (dropbear_keys or '/etc/keys/dss /etc/keys/rsa /etc/keys/ecdsa /etc/keys/ed25519') | parse_list %}
    -r {{key}} \
{% endfor %}
    -e -E -F -P pid {{dropbear_flags}}
EOF

chmod +x run script
{% endblock %}
