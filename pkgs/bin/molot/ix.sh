{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/39.tar.gz
{% endblock %}

{% block go_sha %}
da723971829966d7684ca2dd5528b9b25d61ddadcf2963da93fee664afe7b2f9
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
