{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/5.tar.gz
{% endblock %}

{% block go_sha %}
bb8c6dca9bd761ee1ee0e659a4185881ec9dacebe2416240f55118ad251e90a7
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
