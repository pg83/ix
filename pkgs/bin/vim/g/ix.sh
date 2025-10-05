{% extends '//bin/vim/ix.sh' %}

{# can not build without X now #}

{% block bld_libs %}
lib/gtk/3
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--enable-gui=gtk3
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/wayland
{% endblock %}
