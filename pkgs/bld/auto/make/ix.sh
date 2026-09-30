{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if (all_system or system_automake) and ix_boot_tool('automake') %}
bld/system/shim(tool_name={{ix_boot_tool('automake')}})
bld/system/shim(tool_name={{ix_boot_tool('aclocal')}})
{% elif all_system or system_automake %}
{{ix.warn('automake not found in system, building from source')}}
bin/auto/make/{{make_ver or '1/16/5'}}(std_box=bld/system/box,libc_lite=1)
{% elif make_ver %}
bin/auto/make/{{make_ver}}
{% elif native %}
bin/auto/make/1/16/5(std_box=bld/boot/box)
{% else %}
bin/auto/make/1/16/5
{% endif %}
{% endblock %}
