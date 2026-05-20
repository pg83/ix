{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/wirez/archive/refs/tags/4.tar.gz
{% endblock %}

{% block go_sha %}
840197ef298ab086a76da02adedf4d395d50a07e10a294f75e9956769199c710
{% endblock %}

{% block go_bins %}
wirez
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
