{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/make/lite(std_box=bld/boot/box,intl_ver=no)
{% endblock %}
