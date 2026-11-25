{% extends '//die/go/build.sh' %}

{% block pkg_name %}
miller
{% endblock %}

{% block version %}
6.23.0
{% endblock %}

{% block go_url %}
https://github.com/johnkerl/miller/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
533e6eaf2b24fcfc61947adc08853f5931bb169039450cd83a5d23f6aab33072
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/mlr
{% endblock %}

{% block go_bins %}
mlr
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
