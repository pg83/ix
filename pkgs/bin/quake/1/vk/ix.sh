{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/Novum/vkQuake/archive/refs/tags/1.32.0.tar.gz
sha:c9f5d305358fb44c5e0944c4f73d2d4887574178253ad092d11489925d7ef433
{% endblock %}

{% block bld_libs %}
lib/c
lib/mad
lib/opus
lib/sdl/2
lib/kernel
lib/dbus/dl
lib/xiph/ogg
lib/opus/file
lib/xiph/flac
#lib/drivers/3d
lib/xiph/vorbis
lib/vulkan/loader
bin/quake/1/vk/dl
lib/vulkan/loader/dl
lib/swift/shader/driver
{% endblock %}

{% block bld_tool %}
bin/glslang
bld/spirv/tools
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp $(find ${tmp} -type f -name vkquake) ${out}/bin/
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
