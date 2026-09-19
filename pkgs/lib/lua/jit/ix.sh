{% extends '//lib/lua/t/ix.sh' %}

{% block pkg_name %}
LuaJIT
{% endblock %}

{% block version %}
2.0.5
{% endblock %}

{% block fetch %}
https://github.com/LuaJIT/LuaJIT/archive/0bf80b07b0672ce874feedcc777afe1b791ccb5a.tar.gz
ecd9259c8beb062a9020775611815e419674641adbd195417eef2108454c9e16
{% endblock %}

{% block lib_deps %}
{{super()}}
# for unwinder
lib/c++
{% endblock %}

{% block make_flags %}
BUILDMODE=static
TARGET_LIBS="${PWD}/dl.o"
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/include
mv luajit*/* ./
sed -e 's|/luajit-.*||' \
    -i ${out}/lib/pkgconfig/luajit.pc
{% endblock %}

{% block lua_dlopen %}
src/lib_package.c
{% endblock %}

{% block env %}
export LUA_INCLUDE_DIR="${out}/include"
export CMFLAGS="-DWITH_LUA_ENGINE=LuaJIT \${CMFLAGS}"
{% endblock %}
