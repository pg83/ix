{% extends '//die/go/build.sh' %}

{% block pkg_name %}
geesefs
{% endblock %}

{% block version %}
0.43.9
{% endblock %}

{% block go_url %}
https://github.com/yandex-cloud/geesefs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
2a05f3c0111a4227e844e2db560a468a728837cc112726ca7fb28eba9b32e094
{% endblock %}

{% block go_bins %}
geesefs
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
