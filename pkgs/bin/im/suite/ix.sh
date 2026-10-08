{% extends '//die/c/pybuild.sh' %}

{% block pkg_name %}
suite
{% endblock %}

{% block git_repo %}
https://github.com/impulse-desktop/suite
{% endblock %}

{% block git_commit %}
1
{% endblock %}

{% block git_sha %}
161849ccfa723c52608b1018e8a4506730728395b3eb137e2513d17108cb72d7
{% endblock %}

{% block pybuild_target %}
im
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/png
lib/jxl
lib/linux/headers
lib/ffmpeg
lib/openal
lib/wayland
lib/xkb/common
lib/vulkan/loader
lib/vulkan/drivers
lib/vulkan/headers
lib/shim/fake/pkg(pkg_name=cairo,pkg_ver=1)
lib/shim/fake/pkg(pkg_name=fontconfig,pkg_ver=1)
{% endblock %}

{% block bld_tool %}
bld/wabt
bld/wayland
bin/glslang
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp im ${out}/bin/
cd ${out}/bin
for x in screenshot view play read edit choose ui; do
    ln -s im im${x}
done
{% endblock %}
