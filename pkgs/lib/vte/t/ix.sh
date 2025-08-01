{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
vte
{% endblock %}

{% block version %}
0.80.3
{% endblock %}

{% block fetch %}
https://github.com/GNOME/vte/archive/refs/tags/{{self.version().strip()}}.tar.gz
8567106c7664251e950cfd81db29034b2e4e2e8c1abf6a0cc4ea56394cf21074
{% endblock %}

{% block lib_deps %}
lib/c
lib/lz4
lib/c++
lib/icu
lib/atk
lib/glib
lib/pango
lib/pcre/2
lib/fribidi
lib/fast/float
{% endblock %}

{% block bld_libs %}
lib/kernel
lib/shim/wait
{% endblock %}

{% block bld_tool %}
bld/bash
bld/glib
bld/prepend
{% endblock %}

{% block meson_flags %}
gir=false
vapi=false
gnutls=false
_systemd=false
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|std::from_chars|xxx_from_chars|' -i ${l}
done
sed -e 's|+ debug_sources||' -i src/app/meson.build
echo 'int main() {}'  > src/color-test.cc
prepend src/icu-glue.hh << EOF
#include <string_view>
EOF
cat << EOF > src/xxx.hh
#pragma once
#include <fast_float/fast_float.h>
#include <charconv>
inline std::from_chars_result from_chars_impl(const char* first, const char* last, double& value) {
    auto ret = fast_float::from_chars(first, last, value);
    return {ret.ptr, ret.ec};
}

inline std::from_chars_result from_chars_impl(const char* first, const char* last, long& value) {
    return std::from_chars(first, last, value);
}

inline std::from_chars_result from_chars_impl(const char* first, const char* last, unsigned long& value) {
    return std::from_chars(first, last, value);
}

template <class It, class V>
inline std::from_chars_result xxx_from_chars(It first, It last, V& value) {
    auto ptr = &*first;
    return from_chars_impl(ptr, ptr + (last - first), value);
}

template <class It, class V>
inline std::from_chars_result xxx_from_chars(It first, It last, V& value, int fmt) {
    auto ptr = &*first;
    return std::from_chars(ptr, ptr + (last - first), value, fmt);
}

template <class It, class V>
inline std::from_chars_result xxx_from_chars(It first, It last, V& value, std::chars_format fmt) {
    auto ptr = &*first;
    return from_chars_impl(ptr, ptr + (last - first), value);
}

template <class S>
inline auto xxx_end(S& s) {
    return s.data() + s.length();
}

template <class S>
inline auto xxx_begin(S& s) {
    return s.data();
}
EOF
prepend src/termprops.hh << EOF
#include "xxx.hh"
EOF
sed -e 's|std::end(str)|xxx_end(str)|' -i src/termprops.hh
sed -e 's|std::begin(str)|xxx_begin(str)|' -i src/termprops.hh
prepend src/minifont.cc << EOF
#include <algorithm>
EOF
prepend src/color-parser.cc << EOF
#include "xxx.hh"
EOF
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
