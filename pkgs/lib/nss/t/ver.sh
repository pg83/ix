{% block pkg_name %}
nss
{% endblock %}

{% block version %}
3.131
{% endblock %}

{% block fetch_impl %}
https://ftp.mozilla.org/pub/security/nss/releases/NSS_{{self.version().strip().replace('.', '_')}}_RTM/src/nss-{{self.version().strip()}}.tar.gz
ca0005bc77e9255d9942103e6f9756cfe311a3df72afa99860709e386eb3c167
{% endblock %}
