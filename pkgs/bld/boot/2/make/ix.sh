{% extends '//bin/make/old/ix.sh' %}

{% block make_no_thrs %}{% endblock %}

{% block bld_libs %}
bld/boot/1/lib/c
{% endblock %}

{% block bld_deps %}
bld/boot/2/wak
bld/boot/2/minised
bld/boot/2/sbase
bld/boot/2/bmake
bld/boot/0/env
{% endblock %}

{% block patch %}
{% if linux %}
>lib/fnmatch.c
{% endif %}
{% endblock %}

{% block script_exec %}
["/usr/bin/env", "PATH={{ix_boot_path}}", "sh", "-s"]
{% endblock %}
