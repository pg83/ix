{# The tool that appends a program and its libraries to a solo stub, making
   one self-loading file. It is a script, so this package only fetches and
   installs: die/std brings no compiler, and the container format ships from
   the same source tree as the loader that reads it. #}

{% extends '//die/std/ix.sh' %}

{% include '//lib/dlfcn/elf/t/ver.sh' %}

{% block run_deps %}
bin/python
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
install -Dm755 dev/solo_pack.py ${out}/bin/solo-pack
{% endblock %}

{% block strip_bin %}
: a script has nothing to strip, and no toolchain is here to try
{% endblock %}
