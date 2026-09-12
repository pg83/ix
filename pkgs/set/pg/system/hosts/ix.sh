{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/etc/hosts.d

cat << EOF > ${out}/etc/hosts.d/01-lab.conf
192.168.100.16 lab1.mesh
192.168.100.17 lab2.mesh
192.168.100.18 lab3.mesh
192.168.100.64 home.mesh
192.168.100.65 mini.mesh
192.168.100.66 work.mesh
10.0.0.64      lab1.local
10.0.0.68      lab2.local
10.0.0.72      lab3.local
10.0.0.76      lab4.local
EOF
{% endblock %}
