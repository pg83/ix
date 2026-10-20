{% block pkg_name %}
nss
{% endblock %}

{% block version %}
3.131.1
{% endblock %}

{% block fetch_impl %}
https://ftp.mozilla.org/pub/security/nss/releases/NSS_{{self.version().strip().replace('.', '_')}}_RTM/src/nss-{{self.version().strip()}}.tar.gz
b1dbc1d9e7f3f8455dfb6d58ec8f7229d8a8450c629a9e69ef2ef6081f359056
{% endblock %}
