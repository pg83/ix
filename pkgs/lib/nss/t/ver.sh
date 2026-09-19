{% block pkg_name %}
nss
{% endblock %}

{% block version %}
3.129
{% endblock %}

{% block fetch_impl %}
https://ftp.mozilla.org/pub/security/nss/releases/NSS_{{self.version().strip().replace('.', '_')}}_RTM/src/nss-{{self.version().strip()}}.tar.gz
38baa3b0a18a3f674843473b549753c96419a0151abd1e7a9b214ce0493d0785
{% endblock %}
