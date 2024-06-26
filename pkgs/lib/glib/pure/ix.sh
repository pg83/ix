{% extends '//lib/glib/t/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/glib
{% endblock %}

{% block install %}
{{super()}}
find ${out}/ -type f -name '*.pc' | while read i; do
    sed -e 's|.*bindir.*||' \
{% if darwin %}
        -e 's|Libs: .*||' \
{% endif %}
        -i ${i}
done
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/glib-2.0 -I${out}/lib/glib-2.0/include \${CPPFLAGS}"
{% endblock %}
