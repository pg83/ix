{% extends '//bin/weechat/static/ix.sh' %}

# check bin/weechat

{% block cmake_flags %}
{{super()}}
ENABLE_NCURSES=OFF
ENABLE_HEADLESS=ON
{% endblock %}

{% block bin %}weechat-headless{% endblock %}
