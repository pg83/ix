{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
nvme-cli
{% endblock %}

{% block version %}
3.0
{% endblock %}

{% block fetch %}
https://github.com/linux-nvme/nvme-cli/archive/refs/tags/v{{self.version().strip()}}.tar.gz
37db80e4303403434f169265be4c0f28fedbc37862a54ad49c7cb289f677c6fe
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/nvme
lib/json/c
lib/shim/gnu/basename/overlay
{% endblock %}

{% block bld_tool %}
bld/bash
{% endblock %}

{% block cpp_defines %}
u_int32_t=unsigned
__uint16_t=uint16_t
LC_MEASUREMENT=0
{% endblock %}

{% block patch %}
sed -e 's|= is_temp.*|= false;|' \
    -i nvme-print.c
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv sbin bin
{% endblock %}
