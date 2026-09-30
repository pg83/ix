{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_libtool) and ix_boot_tool('libtoolize') %}
bld/system/shim(tool_name={{ix_boot_tool('libtoolize')}})
bld/system/shim(tool_name={{ix_boot_tool('libtool')}})
{% elif all_system or system_libtool %}
{{ix.warn('libtoolize not found in system, building from source')}}
bin/libtool(std_box=bld/system/box,libc_lite=1)
{% elif native %}
bin/libtool(std_box=bld/boot/box)
{% else %}
bin/libtool
{% endif %}
{% endblock %}
