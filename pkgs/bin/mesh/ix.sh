{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/2.tar.gz
{% endblock %}

{% block go_sha %}
1cdfc1ff2ed89f84528ba1615bab5e1ca9848598117d991a00253bdcb2a0a7c0
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
