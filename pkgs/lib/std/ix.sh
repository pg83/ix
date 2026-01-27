{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/pg83/std/archive/refs/tags/3.tar.gz
898cf6f64bba412eb2a4861b48dac407503808ab008677ed7394765e4a736ec0
{% endblock %}

{% block lib_deps %}
lib/rapidhash
lib/c++/dispatch
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
