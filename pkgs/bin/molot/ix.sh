{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/25.tar.gz
{% endblock %}

{% block go_sha %}
bf045c93fcaf43a0d961ed8c11c6df45eb1937406aa2bc931ae82105887992fc
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
