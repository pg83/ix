{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
cat << 'EOF' > ${out}/bin/fetcher
#!/usr/bin/env sh
exec assemble fetch --mirrors '
{% include '//die/scripts/mirrors.txt' %}
' --socks5 '{{fetcher_socks5_proxy}}' "$@"
EOF
chmod +x ${out}/bin/*
{% endblock %}
