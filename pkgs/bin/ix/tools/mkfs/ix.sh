{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/box
bin/git
bin/zstd
bin/rsync
bld/python
bin/bsdtar
bin/ix/tools/mkfs/scripts
{% endblock %}
