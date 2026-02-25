{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/pg83/std/archive/refs/tags/4.tar.gz
7f171f6bea09a70618c500a3399d82ba7c35894081392cb30e6af8f862e6ffd1
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
