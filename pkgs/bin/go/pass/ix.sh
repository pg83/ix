{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gopass
{% endblock %}

{% block version %}
1.17.1
{% endblock %}

{% block go_url %}
https://github.com/gopasspw/gopass/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
72584e3a396ed09a006da0ba90e1195533fae46a72b36a24709b34f6dc3b44df
{% endblock %}

{% block go_bins %}
gopass
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
