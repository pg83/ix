{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
imway
{% endblock %}

{% block git_repo %}
https://github.com/pg83/imway
{% endblock %}

{% block git_commit %}
6a8a7cb1ef7f378307fa4eec2fb4e3642dfd1eb9
{% endblock %}

{% block git_sha %}
f35a1cfad2a61d3801602d8e5bb081e4aa20d749c8efbec429004545faf6db87
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/ev
lib/drm
lib/std
lib/seat
lib/udev
lib/input
lib/wayland
lib/xkb/common
lib/vulkan/loader
lib/vulkan/headers
lib/wayland/protocols
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block patch %}
{{super()}}
sed -e '/enable_testing()/d' \
    -e '/add_subdirectory(tests)/d' \
    -e '/add_library(pgstd STATIC IMPORTED)/d' \
    -e '/set_target_properties(pgstd PROPERTIES IMPORTED_LOCATION/d' \
    -e 's|target_include_directories(pgstd INTERFACE.*|add_library(pgstd INTERFACE)\nfind_library(PGSTD_LIB std REQUIRED)\ntarget_link_libraries(pgstd INTERFACE ${PGSTD_LIB})|' \
    -i CMakeLists.txt
{% endblock %}

{% block cmake_flags %}
STD_ROOT=ix
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp {{ninja_build_dir}}/imway ${out}/bin/
{% endblock %}
