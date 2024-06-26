{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/sgiurgiu/reddit_desktop
{% endblock %}

{% block git_commit %}
5bfdcfec0f2e5b0ab1ea30bd0316d11049904a84
{% endblock %}

{% block git_sha %}
2bd8949264bac9d36162448001fdc09881efec58b267817a587227c59f47e3b7
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/mpv
lib/fmt
lib/stb
lib/glfw
lib/boost
lib/gumbo
lib/opengl
lib/spdlog
lib/openssl
lib/sqlite/3
lib/freetype
lib/decor/dl
lib/uriparser
lib/shim/glew
lib/glfw/deps
lib/shim/fake(lib_name=OpenGL)
{% endblock %}

{% block cmake_flags %}
ENABLE_TESTS=OFF
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin
ln -s ../share/reddit_desktop/fonts ./
{% endblock %}
