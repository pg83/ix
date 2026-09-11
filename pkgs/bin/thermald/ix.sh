{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
thermal_daemon
{% endblock %}

{% block version %}
2.5.13
{% endblock %}

{% block fetch %}
https://github.com/intel/thermal_daemon/archive/refs/tags/v{{self.version().strip()}}.tar.gz
5456f60aed52e9a14f88dde9b2e2875e5e3d0cc3d1e7bf742d7ea4b22ff6a995
{% endblock %}

{% block bld_libs %}
lib/c
lib/xz
lib/c++
lib/evdev
lib/xml/2
lib/kernel
lib/upower
lib/dbus/glib
{% endblock %}

{% block bld_tool %}
bld/glib
bld/python
bld/gtkdoc
lib/dbus/glib
bld/auto/archive
{% endblock %}

{% block autoreconf %}
export NO_CONFIGURE=1
{{super()}}
{% endblock %}

{% block make_flags %}
DBUS_SYS_DIR=${out}/etc/dbus-1
{% endblock %}
