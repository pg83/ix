{% extends '//bin/coreutils/8/31/ix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/5/sed
bld/boot/5/patch
bld/boot/5/byacc
bld/boot/5/mawk
bld/boot/4/env
{% endblock %}

{% block cpp_includes %}
${PWD}/lib
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="-Wno-incompatible-function-pointer-types ${CFLAGS}"
export PATH="${PWD}/src:${PATH}"
{% endblock %}
