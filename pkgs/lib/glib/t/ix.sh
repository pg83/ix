{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/glib/2.84/glib-2.84.0.tar.xz
sha:f8823600cb85425e2815cfad82ea20fdaa538482ab74e7293d58b3f64a5aff6a
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/ffi
lib/intl
lib/iconv
lib/pcre/2
{% if darwin %}
lib/shim/dll(dll_name=resolv)
lib/darwin/framework/AppKit
lib/darwin/framework/CoreServices
lib/darwin/framework/Foundation
{% endif %}
{% endblock %}

{% block bld_tool %}
bin/meson/1/4
{% if darwin %}
bld/cctools
{% endif %}
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE=1
{% endblock %}

{% block cpp_includes %}
${PWD}/inc
{% endblock %}

{% block patch %}
sed -e 's|.*static_assert.*||'   \
    -e 's|.*G_STATIC_ASSERT.*||' \
    -i gio/gio-launch-desktop.c
{% endblock %}

{% block configure1 %}
{{super()}}
cat << EOF >> ${tmp}/obj/config.h
#undef HAVE_FREE_SIZED
#undef HAVE_FREE_ALIGNED_SIZED
EOF
{% endblock %}

{% block meson_flags %}
tests=false
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
