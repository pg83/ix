{% extends '//die/go/build.sh' %}

{% block pkg_name %}
lazygit
{% endblock %}

{% block version %}
0.65.0
{% endblock %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
0695c8e2a1f690b437abbcfdc47dd617029f45b553b53b4411950c5cc1f7a900
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

{% block go_bins %}
lazygit
{% endblock %}
