{% extends '//die/go/build.sh' %}

{% block pkg_name %}
oras
{% endblock %}

{% block version %}
1.3.5
{% endblock %}

{% block go_url %}
https://github.com/oras-project/oras/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
b691e8390ce21816c5908e78e069dad6da174493e5ffa5eb52ed9027e4831521
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/oras
{% endblock %}

{% block go_bins %}
oras
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
