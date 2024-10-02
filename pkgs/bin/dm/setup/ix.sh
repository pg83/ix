{% extends '//lib/device/mapper/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/aio
{% endblock %}

{% block configure_flags %}
{{super()}}
--enable-static_link
--with-default-system-dir=${out}/etc/lvm
{% endblock %}

{% block patch %}
{{super()}}
base64 -d | patch -p1 << EOF
{% include 'fix-stdio-usage.patch' %}
EOF
sed -e 's|ndef VALGRIND_POOL.*| 0|' \
    -i lib/commands/toolcontext.c
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin/* ${out}/bin/
mv ${out}/bin/dmsetup.static ${out}/bin/dmsetup
mv ${out}/bin/dmstats.static ${out}/bin/dmstats
rm ${out}/bin/lvm.static
rm -rf ${out}/sbin
{% endblock %}
