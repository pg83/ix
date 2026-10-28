{% extends '//die/go/build.sh' %}

{% block pkg_name %}
act
{% endblock %}

{% block version %}
0.2.92
{% endblock %}

{% block go_url %}
https://github.com/nektos/act/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
921e9ce7f06670185302c4e55d9e27e457e42928e0dd85bc0ca1288800301a5e
{% endblock %}

{% block go_bins %}
act
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
