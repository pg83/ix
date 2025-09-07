{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SDL
{% endblock %}

{% block version %}
3.2.22
{% endblock %}

{% block fetch %}
https://github.com/libsdl-org/SDL/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
911c2d5c3d22efc29af9a2cef6cdfacba30d965242c383d997c93078e6474b01
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
SDL_STATIC=OFF
SDL_SHARED=ON
SDL_ARTS=OFF
SDL_ARTS_SHARED=OFF
SDL_ESD=OFF
SDL_ESD_SHARED=OFF
SDL_JACK=OFF
SDL_JACK_SHARED=OFF
SDL_NAS=OFF
SDL_NAS_SHARED=OFF
SDL_LIBSAMPLERATE=OFF
SDL_LIBSAMPLERATE_SHARED=OFF
{% endblock %}

{% block c_flags %}
-Wno-incompatible-function-pointer-types
{% endblock %}

{% block patch %}
sed -e 's|define SDL_DYNAMIC_API 1|define SDL_DYNAMIC_API 0|' \
    -i src/dynapi/SDL_dynapi.h
{% endblock %}

{% block env %}
export SDL3_LIBRARY=${out}/lib/libSDL3.a
export SDL3_HEADERS=${out}/include/SDL3
{% endblock %}

{% block c_rename_symbol %}
g_object_ref
g_object_ref_sink
{% endblock %}
