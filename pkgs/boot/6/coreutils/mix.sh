{% extends '//boot/4/coreutils/mix.sh' %}

{% block bld_libs %}
boot/4/lib/compiler_rt/mix.sh
{% endblock %}

{% block bld_deps %}
boot/5/env/std/mix.sh
boot/4/patch/mix.sh
boot/4/byacc/mix.sh
{% endblock %}
