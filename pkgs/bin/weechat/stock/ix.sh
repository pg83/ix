{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/weechat/weechat/archive/refs/tags/v4.3.3.tar.gz
sha:d661579570331c258854a87037095c7d16142e972191a4c4e1437f369a5fd48f
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
