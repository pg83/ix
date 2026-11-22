{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
CorsixTH
{% endblock %}

{% block version %}
0.70.3
{% endblock %}

{% block fetch %}
https://github.com/CorsixTH/CorsixTH/archive/refs/tags/v{{self.version().strip()}}.tar.gz
83bb446923f161f42cc0ff6de7fa47f4fb23c455973c40e0b5708d91193b1ed8
{% endblock %}

{% block cmake_flags %}
WITH_MIDI_DEVICE=OFF
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/lua
lib/curl
lib/sdl/2
lib/ffmpeg
lib/sdl/deps
lib/freetype
lib/sdl/2/mixer
lib/lua/modules/lfs/dl
{% endblock %}
