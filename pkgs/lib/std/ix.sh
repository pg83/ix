{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/pg83/std/archive/refs/tags/5.tar.gz
5cbc8d156738316ce13dc60ac182ca9911b463748754ced51b568936dd8933f6
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
