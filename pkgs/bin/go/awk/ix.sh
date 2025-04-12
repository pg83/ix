{% extends '//die/go/build.sh' %}

{% block pkg_name %}
goawk
{% endblock %}

{% block version %}
1.28.1
{% endblock %}

{% block go_url %}
https://github.com/benhoyt/goawk/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
2582676d9bf42dc068f6732ccea4733d87699b9f2260aceb2a6cd2096852ed88
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp goawk ${out}/bin/
{% endblock %}
