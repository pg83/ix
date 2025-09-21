{% extends '//die/go/build.sh' %}

{% block pkg_name %}
hysteria
{% endblock %}

{% block version %}
2.6.3
{% endblock %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
c57f0a7479a8158be2a27234cfa5c86990e237f105f2b282eee90a9fa3513717
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block unpack %}
{{super()}}
cd app
{% endblock %}

{% block go_bins %}
app
{% endblock %}

{% block setup_target_flags %}
export GOWORK=off
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/bin/app ${out}/bin/hysteria
{% endblock %}
