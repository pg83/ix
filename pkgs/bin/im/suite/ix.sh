{% extends '//die/c/pybuild.sh' %}

{% block pkg_name %}
suite
{% endblock %}

{% block git_repo %}
https://github.com/impulse-desktop/suite
{% endblock %}

{% block git_commit %}
3
{% endblock %}

{% block git_sha %}
fa59048f10dbfa675382ab0ba109bd7a351b83a60ad18dfb9bc59de62c4b1ec0
{% endblock %}

{% block pybuild_target %}
im
{% endblock %}

{% block pybuild_flags %}
-Ddecode_wasm=${IX_IMAGE_MAGICK_DECODE_WASM}
-Dpdf_wasm=${IX_PDFIUM_WASM}
-Ddjvu_wasm=${IX_DJVULIBRE_WASM}
-Dmagic_wasm=${IX_MAGIC_WASM}
{% endblock %}

{% block bld_data %}
lib/image/magick/wasm(target=wasm32-none,kind=lib,simd128=1)
lib/pdf/ium/wasm(target=wasm32-none,kind=lib)
lib/djvulibre/wasm(target=wasm32-none,kind=lib)
lib/magic/wasm(target=wasm32-none,kind=lib)
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/png
lib/jxl
lib/linux/headers
lib/simd/e
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
sh dev/install.sh ${out}
{% endblock %}
