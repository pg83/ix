{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/emersion/mrsh/archive/cd3c3a48055ab4085d83f149ff4b4feba40b40cb.zip
md5:23e571a3436846a1722ddbdfc22e3377
{% endblock %}

{% block bld_libs %}
lib/c
lib/readline
{% endblock %}

{% block patch %}
sed -e 's|elif host_machine.*|elif 1 == 1|' -i meson.build
{% endblock %}
