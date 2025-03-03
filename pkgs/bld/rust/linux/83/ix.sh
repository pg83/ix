{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://static.rust-lang.org/dist/rust-1.83.0-x86_64-unknown-linux-musl.tar.gz
sha:d1d379e8bb545466f53f8a5821dfbc7129e8cab046c44c0a9ea089eeff1616e1
https://static.rust-lang.org/dist/rust-std-1.83.0-aarch64-unknown-linux-musl.tar.gz
sha:bb10f2db36538990ec43170c40b33995aed4f2fcfd9e1ff8014336644c3cb339
{% endblock %}

{% block bld_tool %}
bld/musl
bin/patch/elf
{% endblock %}

{% block step_unpack %}
:
{% endblock %}

{% block install %}
find ${src} -type f -name '*.gz' | sort | while read l; do
    mkdir src
    cd src
    extract 1 ${l}
    cat components | while read x; do
        cp -R ${x}/* ${out}/
    done
    cd ..
    rm -rf src
done
{% endblock %}

{% block postinstall %}
rm -rf ${out}/share
rm -rf ${out}/lib/rustlib/x86_64-unknown-linux-musl/bin
rm -rf ${out}/lib/rustlib/aarch64-unknown-linux-musl/bin
find ${out} -type f -executable | while read l; do
    echo "patch ${l}"
    patchelf --set-interpreter ${LDSO} ${l} || true
done
{% endblock %}

{% block env %}
export LD_LIBRARY_PATH=\${LD_LIBRARY_PATH}:${out}/lib
{% endblock %}
