{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
weechat
{% endblock %}

{% block version %}
4.10.5
{% endblock %}

{% block fetch %}
https://github.com/weechat/weechat/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6a48485fc7096018ee015184a3000bf6331a9fc75b3a6c1f0722b41306e22644
{% endblock %}

{% block bld_libs %}
lib/c
lib/lua
lib/intl
lib/curl
lib/gcrypt
lib/gnutls
lib/c/json
lib/enchant
lib/shim/fake/pkg(pkg_name=lua,pkg_ver=5.4)
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block cmake_flags %}
ENABLE_NLS=OFF
ENABLE_PERL=OFF
ENABLE_PYTHON=OFF
ENABLE_RUBY=OFF
ENABLE_TCL=OFF
ENABLE_GUILE=OFF
ENABLE_PHP=OFF
ENABLE_ENCHANT=ON
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
