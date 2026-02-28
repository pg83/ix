{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/pg83/std/archive/refs/tags/6.tar.gz
32587c3a602abb0dca0982164f9155925abeefe2c70263f4831b94521f4ccce2
{% endblock %}

{% block lib_deps %}
lib/c++/dispatch
{% endblock %}

{% block bld_libs %}
lib/rapidhash
{% endblock %}

{% block install %}
mkdir ${out}/lib
mkdir ${out}/include
rm -rf tst
cp std/libstd.a ${out}/lib/
find . -type d | while read l; do
    mkdir -p ${out}/include/${l}
done
find . -type f -name '*.h' | while read l; do
    cp ${l} ${out}/include/${l}
done
{% endblock %}

{% block make_target %}
std/libstd.a
{% endblock %}
