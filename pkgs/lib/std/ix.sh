{% extends '//die/c/pybuild.sh' %}

{% block fetch %}
https://github.com/pg83/std/archive/a657c2667d0aa3080a472015fa9e3cd22dc58bd5.tar.gz
9de7b47b6eef5ad437035c1879e4a8c26877f9b3eb4fd2fca13e9cfb028d1968
{% endblock %}

{% block lib_deps %}
lib/c++/dispatch
{% endblock %}

{% block bld_libs %}
lib/rapidhash
lib/linux/headers
{% endblock %}

{% block pybuild_target %}
libstd
{% endblock %}

{% block install %}
mkdir ${out}/lib
mkdir ${out}/include
cp libstd ${out}/lib/libstd.a
find std -type d | while read l; do
    mkdir -p ${out}/include/${l}
done
find std -type f -name '*.h' | while read l; do
    cp ${l} ${out}/include/${l}
done
{% endblock %}
