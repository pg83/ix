cat << EOF > which
#!$(command -v sh)
command -v "\$@"
EOF

chmod +x which

for x in ps strip ldconfig; do
    cat << EOF > ${x}
#!$(which sh)
EOF
done

cat << EOF > arch
#!$(which sh)
echo '{{target.arch}}'
EOF

cat << EOF > hostname
#!$(which sh)
echo localhost
EOF

{% if darwin %}
{% block sw_vers %}
cat << EOF > sw_vers
#!$(which sh)
echo \${MACOSX_DEPLOYMENT_TARGET}
EOF
{% endblock %}
{% endif %}

chmod +x *
