{% extends '//die/c/kconfig2.sh' %}

{% block fetch %}
https://busybox.net/downloads/busybox-1.37.0.tar.bz2
sha:3311dff32e746499f4df0d5df04d7eb396382d7e108bb9250e7b519b837043a4
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux/headers/prev
{% endblock %}

{% block bld_tool %}
bld/perl
bin/bzip2
{% endblock %}

{% block build_flags %}
shut_up
{% endblock%}

{% block setup_target_flags %}
export SKIP_STRIP=y
{% endblock %}

{% block make_target %}
busybox
busybox.links
{% endblock %}

{% block install %}
mkdir ${out}/bin
mv busybox ${out}/bin/
cat busybox.links | (cd ${out}/bin; while read l; do
    ln -s busybox $(basename ${l})
done)
{% endblock %}
