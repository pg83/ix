{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/xdg/open
bin/telegram/desktop/unwrap(allocator=tcmalloc,ffmpeg_ver=6)
{% endblock %}
