{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_autoconf) and ix_boot_tool('autoconf') %}
bld/system/shim(tool_name={{ix_boot_tool('autoconf')}})
bld/system/shim(tool_name={{ix_boot_tool('autoreconf')}})
bld/system/shim(tool_name={{ix_boot_tool('autoheader')}})
bld/system/shim(tool_name={{ix_boot_tool('autom4te')}})
bld/system/shim(tool_name={{ix_boot_tool('autoupdate')}})
bld/system/shim(tool_name={{ix_boot_tool('autoscan')}})
bld/system/shim(tool_name={{ix_boot_tool('ifnames')}})
{% elif all_system or system_autoconf %}
{{ix.warn('autoconf not found in system, building from source')}}
bin/auto/conf/{{conf_ver or '2/69'}}(std_box=bld/system/box,libc_lite=1)
{% elif conf_ver %}
bin/auto/conf/{{conf_ver}}
{% elif native %}
bin/auto/conf/2/69(std_box=bld/boot/box)
{% else %}
bin/auto/conf/2/69
{% endif %}
{% endblock %}
