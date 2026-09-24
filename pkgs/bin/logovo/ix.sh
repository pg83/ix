{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/logovo/archive/refs/tags/4.tar.gz
{% endblock %}

{% block go_sha %}
deffa8cf05878bb14cc9c43a6920b439217e6a42b2c578e23adf0927c7efea4a
{% endblock %}

{% block go_bins %}
logovo
{% endblock %}
