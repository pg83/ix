{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/assemble/archive/b66418c2d28afac3d33c0327405bf0d9ab43c86d.tar.gz
{% endblock %}

{% block go_sha %}
d8c4ce1c09a3f2f7294ac8ccb95f8e69fe99832f1bc424378450c50fcdf01a61
{% endblock %}

{% block go_bins %}
assemble
{% endblock %}
