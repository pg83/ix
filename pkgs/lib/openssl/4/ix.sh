{% extends 't/ix.sh' %}

# noauto

{% block pkg_name %}
openssl
{% endblock %}

{% block version %}
4.0.3
{% endblock %}

{% block fetch %}
https://github.com/openssl/openssl/archive/refs/tags/openssl-{{self.version().strip()}}.tar.gz
29cbaaabad1f3b0e8f28274eb8445a1cb0c54af21a6f845882ee018763df7159
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-openssl-quic \${COFLAGS}"
{% endblock %}
