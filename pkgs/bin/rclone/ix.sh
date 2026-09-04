{% extends '//die/go/build.sh' %}

{% block pkg_name %}
rclone
{% endblock %}

{% block version %}
1.75.1
{% endblock %}

{% block go_url %}
https://github.com/rclone/rclone/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
de470a175be813c1da57a48346a8f9506d1576fd319a322e8da6790b728719dc
{% endblock %}

{% block go_bins %}
rclone
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
