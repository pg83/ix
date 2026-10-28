{% extends '//die/go/build.sh' %}

{% block pkg_name %}
act
{% endblock %}

{% block version %}
0.2.90
{% endblock %}

{% block go_url %}
https://github.com/nektos/act/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
204210c0bcee88308814ecebffbf70b12591964abf71cc1438e96decbefb9ba6
{% endblock %}

{% block go_bins %}
act
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
