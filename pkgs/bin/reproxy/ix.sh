{% extends '//die/go/build.sh' %}

{% block pkg_name %}
reproxy
{% endblock %}

{% block version %}
1.7.2
{% endblock %}

{% block go_url %}
https://github.com/umputun/reproxy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
295c3fb53fa029360c5c5697f23ea3be63f39e2d84b63e9b3eb34fca74a62431
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}

{% block unpack %}
{{super()}}
cd app
{% endblock %}

{% block go_bins %}
app
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/bin/app ${out}/bin/reproxy
{% endblock %}
