{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/openssh/client
etc/services/runit(srv_deps=bin/openssh/client,srv_dir=vpn,srv_user=nobody,srv_command=exec ssh -N -D 1080 root@176.74.218.69 -o StrictHostKeyChecking=no {{vpn_password}})
{% endblock %}
