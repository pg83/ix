{% extends '//die/go/build.sh' %}

{% block pkg_name %}
walk
{% endblock %}

{% block version %}
1.14.0
{% endblock %}

{% block go_url %}
https://github.com/antonmedv/walk/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
c079f3baa2523269b03c07cdf95e5489f9ef965a315f206caf8128f40664d00f
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.17|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block go_bins %}
walk
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
