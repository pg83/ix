{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
glib
{% endblock %}

{% block version %}
2.84.2
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/glib/2.84/glib-{{self.version().strip()}}.tar.xz
sha:88e960dd937057407d61fcb3b45a860704b25923c37ae2478b85f2ecb5a4021f
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
