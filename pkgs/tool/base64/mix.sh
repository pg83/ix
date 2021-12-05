{% extends '//mix/template/std.sh' %}

{% block fetch %}
https://github.com/aklomp/base64/archive/refs/tags/v0.4.0.tar.gz
dc02ea0324279df0ecdc23d519dbcaa0
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}

{% block toolconf %}
ln -s $(which llvm-objcopy) objcopy
{% endblock %}

{% block build %}
make bin/base64
{% endblock %}

{% block install %}
mkdir ${out}/bin && cp bin/base64 ${out}/bin
{% endblock %}
