{% extends '//die/go/build.sh' %}

{% block pkg_name %}
httpx
{% endblock %}

{% block version %}
1.12.0
{% endblock %}

{% block go_url %}
https://github.com/projectdiscovery/httpx/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
af4e0b62cba2a3aeb5cc402e81c8a26f7df25c472740c024edeb379c6508ed79
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/httpx
{% endblock %}

{% block go_bins %}
httpx
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
