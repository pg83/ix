{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gum
{% endblock %}

{% block version %}
2.0.1
{% endblock %}

{% block go_url %}
https://github.com/charmbracelet/gum/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
694e427f71de0d77cebe56fc5b6ff5d9f603c96eaa60032ae40f6920af02ba25
{% endblock %}

{% block go_bins %}
gum
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
