{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fluidsynth
{% endblock %}

{% block version %}
2.6.3
{% endblock %}

{% block git_repo %}
https://github.com/FluidSynth/fluidsynth
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
b846b5f6085d6acf36e1da1fe16ab2e035d821992d3b60466b30fbcdcc048080
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}

{% block bld_libs %}
lib/signalsmith/dsp
lib/signalsmith/linear
lib/signalsmith/hilbert
{% endblock %}

{% block patch %}
sed -e 's|FetchContent_MakeAvailable(\(.*\))|add_library(\1 INTERFACE)|' \
    -i signalsmith-audio-basics/CMakeLists.txt
{% endblock %}
