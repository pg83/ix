{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/pg83/std/archive/refs/tags/1.tar.gz
688a0c4d6e724545c4ead18f117579c8783ba9e62862a603ef4f3d5f6a9a1f58
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/xxhash
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
