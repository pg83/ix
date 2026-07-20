{% extends '//die/c/pybuild.sh' %}

{% block fetch %}
https://github.com/pg83/std/archive/d6ab6a148dbc06edbc5c1322552e96e0c70d6f80.tar.gz
4d22d440efd7f114af0c0d5e75ea06c4bbe628e34f04262091d4ff08423aa9cf
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
