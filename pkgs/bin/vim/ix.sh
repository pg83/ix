{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
vim
{% endblock %}

{% block version %}
9.2.1178
{% endblock %}

{% block fetch %}
https://github.com/vim/vim/archive/refs/tags/v{{self.version().strip()}}.tar.gz
62b4a204676f0e2d6c11f1951ac204b1c83d22cd3f383599e7455e96cf87a68a
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
