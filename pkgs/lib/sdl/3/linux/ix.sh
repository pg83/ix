{% extends '//lib/sdl/3/t/ix.sh' %}

{% block lib_deps %}
lib/decor
lib/sndio
lib/sdl/gl
lib/wayland
lib/xkb/common
{% if vulkan %}
lib/vulkan/loader
{% endif %}
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/wayland
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
{% if vulkan %}
SDL_VULKAN=ON
{% else %}
SDL_VULKAN=OFF
{% endif %}
SDL_OSS=OFF
SDL_ALSA=OFF
SDL_ALSA_SHARED=OFF
SDL_SNDIO=ON
SDL_SNDIO_SHARED=OFF
SDL_X11=OFF
SDL_WAYLAND=ON
SDL_WAYLAND_SHARED=OFF
SDL_PIPEWIRE=OFF
SDL_PIPEWIRE_SHARED=OFF
SDL_PULSEAUDIO=OFF
SDL_PULSEAUDIO_SHARED=OFF
{% endblock %}
