{% extends '//lib/glib/t/ix.sh' %}

{% block meson_flags %}
{{super()}}
introspection=enabled
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/gi/repository
{% endblock %}

{% block host_libs %}
{{super()}}
lib/glib/dl
lib/glib/gir/deps/dl
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/gir
bld/gir/fix
{% endblock %}

{% block postinstall %}
mv ${out}/lib/gi* ${out}/share/
rm -rf ${out}/bin ${out}/lib ${out}/include
find ${out} -type f -name '*.gir' | while read l; do
    cat ${l} | fix_gir > _
    mv _ ${l}
done
{% endblock %}

{% block env %}
export GIRPATH="${out}/share/gir-1.0:\${GIRPATH}"
export VALAFLAGS="--girdir=${out}/share/gir-1.0 \${VALAFLAGS}"
export GIRSFLAGS="--add-include-path=${out}/share/gir-1.0 \${GIRSFLAGS}"
export GIRCFLAGS="--includedir=${out}/share/gir-1.0 \${GIRCFLAGS}"
{% endblock %}
