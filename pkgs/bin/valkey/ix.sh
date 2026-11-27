{% extends '//bin/redis/t/ix.sh' %}

{% block pkg_name %}
valkey
{% endblock %}

{% block version %}
9.2.1
{% endblock %}

{% block fetch %}
https://github.com/valkey-io/valkey/archive/refs/tags/{{self.version().strip()}}.tar.gz
fec5d34ac6f5c7f35cddcaae368734d8a789f1af2f7c29853e790f093d848d71
{% endblock %}
