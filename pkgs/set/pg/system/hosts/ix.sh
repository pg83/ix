{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/etc/hosts.d

cat << EOF > ${out}/etc/hosts.d/01-lab.conf
10.0.0.64      lab1.local
10.0.0.68      lab2.local
10.0.0.72      lab3.local
10.0.0.76      lab4.local
EOF
{% endblock %}
