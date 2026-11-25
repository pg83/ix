{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gopass
{% endblock %}

{% block version %}
1.17.5
{% endblock %}

{% block go_url %}
https://github.com/gopasspw/gopass/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
ee10c90e7729a3a0b7fcb7179c6d233fdbbc13c758455cdd89625b680325d37f
{% endblock %}

{% block go_bins %}
gopass
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
