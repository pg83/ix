{% extends '//die/go/build.sh' %}

{% block pkg_name %}
lazygit
{% endblock %}

{% block version %}
0.66.1
{% endblock %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
fa83ea30853ffc1674355c61890348401c05ad3c247f64048d6c724219796cf5
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

{% block go_bins %}
lazygit
{% endblock %}
