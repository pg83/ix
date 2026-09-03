{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/assemble/archive/refs/tags/6.tar.gz
{% endblock %}

{% block go_sha %}
ca1485bd72a578e3c6d2ed8d14b437ad6572d8292f0c49bc8fd006dca43091fc
{% endblock %}

{% block go_bins %}
assemble
{% endblock %}
