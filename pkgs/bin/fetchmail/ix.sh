{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
fetchmail
{% endblock %}

{% block version %}
6.6.10
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/fetchmail/branch_{{self.version().strip()[:3]}}/fetchmail-{{self.version().strip()}}.tar.xz
f32f1ecfdb99a243b6f7fef5d1b5f5aeac2bb0a45ce0162552d6063db3b48073
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/gettext
{% endblock %}

{% block conf_ver %}
2/72
{% endblock %}
