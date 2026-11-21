{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
vim
{% endblock %}

{% block version %}
9.2.1380
{% endblock %}

{% block fetch %}
https://github.com/vim/vim/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b0ed9b4c3c9384eb5f77f924bd5382ab995b54c9bcc69bb66ab38f83f3cc5b5b
{% endblock %}

{% block unpack %}
{{super()}}
cd src
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block autoreconf %}
autoconf
{% endblock %}

{% block bld_libs %}
lib/c
lib/acl
lib/curses
{% endblock %}

{% block configure_flags %}
--with-features=huge
--with-compiledby='MIX'
--enable-acl
--disable-gui
--enable-multibyte
--enable-cscope
{% endblock %}
