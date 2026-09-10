{% extends '//die/gen.sh' %}

{# Build-only fallback: assemble's own Go vendor step needs bld/fetch. #}
{% block install %}
mkdir ${out}/bin
cat << EOF > ${out}/bin/fetcher
#!/usr/bin/env python3
M = '''
{% include '//die/scripts/mirrors.txt' %}
'''
P = '''
{{fetcher_socks5_proxy}}
'''
EOF
base64 -d << EOF >> ${out}/bin/fetcher
{% include 'fetcher.py/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}
