{% extends '//lib/dlfcn/elf/t/ix.sh' %}

{% block pybuild_target %}
solo
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp solo ${out}/bin/
{% endblock %}

{# solo is itself a usable stub: appending a program to it makes a bundle
   that needs no libraries beyond what the ABI bridge already serves. The
   tool that does the appending is bin/solo/pack. #}
