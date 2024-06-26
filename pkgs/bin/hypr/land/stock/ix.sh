{% extends '//die/c/meson.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/uuid
lib/pango
lib/cairo
lib/input
lib/opengl
lib/wayland
lib/shim/x11
lib/hypr/lang
lib/xkb/common
lib/drivers/3d
lib/mesa/gl/dl
lib/mesa/egl/dl
lib/hypr/cursor
bin/hypr/wlroots
lib/toml/plus/plus
lib/mesa/glesv2/dl
bin/hypr/wlroots/dl
{% endblock %}

{% block bld_tool %}
bin/jq
bld/wayland
bld/fakegit
bin/hypr/wayland/scanner
{% endblock %}

{% block patch %}
sed -e 's|.*define PI .*||' -i src/macros.hpp
sed -e 's|PI |M_PI |g' -i src/config/ConfigManager.cpp
sed -e 's|PI |M_PI |g' -i src/render/OpenGL.cpp
sed -e 's|PI |M_PI |g' -i src/desktop/Window.cpp
sed -e 's|PI |M_PI |g' -i src/debug/HyprCtl.cpp

sed -e "s|subproject.*wlroots.*|dependency('wlroots')|" \
    -e 's|have_xwlr = .*|have_xwlr = false|' \
    -i meson.build

sed -e 's|.get_variable.*wlroots.*|,|' \
    -i src/meson.build

sed -e 's|) {|) const {|' -i src/helpers/WLClasses.hpp

base64 -d << EOF > src/debug/CrashReporter.cpp
{% include 'CrashReporter.cpp/base64' %}
EOF

cat << EOF > scripts/generateVersion.sh
#!/usr/bin/env sh
EOF
chmod +x scripts/generateVersion.sh

sed -e 's|wayland-server|wayland-scanner|' -i protocols/meson.build
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/share/pkgconfig
{% endblock %}
