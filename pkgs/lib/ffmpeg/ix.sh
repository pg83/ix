{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/ffmpeg/{{ffmpeg_ver or '7'}}
{% endblock %}
