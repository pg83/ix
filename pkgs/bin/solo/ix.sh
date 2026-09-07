{% extends '//lib/dlfcn/elf/t/ix.sh' %}

{% block pybuild_target %}
solo
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp solo ${out}/bin/
# solo is itself a usable stub: appending a program to it makes a bundle
# that needs no libraries beyond what the ABI bridge already serves.
cp dev/solo_pack.py ${out}/bin/solo-pack
chmod +x ${out}/bin/solo-pack
{% endblock %}

{% block run_deps %}
bld/python
{% endblock %}
