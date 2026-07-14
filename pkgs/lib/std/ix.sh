{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/pg83/std/archive/6e1ec7b5543e77527f48d2567c7667dc9b2935e8.tar.gz
27f3d9d9e2f9dbac3d4ecb22ed6fdc27d4136d545c4aedecc11e3fbe4df458da
{% endblock %}

{% block lib_deps %}
lib/c++/dispatch
{% endblock %}

{% block bld_libs %}
lib/rapidhash
lib/linux/headers
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
