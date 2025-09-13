{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/bin ${out}/etc/env.d

base64 -d << EOF > ${out}/bin/session
{% include 'session/base64' %}
EOF

base64 -d << EOF > ${out}/bin/user-session
{% include 'user-session/base64' %}
EOF

cat << EOF > ${out}/etc/env.d/00-session.sh
export LOGIN_SCRIPT=/bin/session
EOF

chmod +x ${out}/bin/*
{% endblock %}
