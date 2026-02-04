{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/openssh/client
etc/services/runit(srv_deps=bin/openssh/client,srv_dir=vpn,srv_user=pg,srv_command=exec ssh -N -D 192.168.100.64:1080 root@176.74.218.69 -o StrictHostKeyChecking=no)
{% endblock %}
