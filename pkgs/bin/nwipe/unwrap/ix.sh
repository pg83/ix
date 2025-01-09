{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/martijnvanbrummelen/nwipe/archive/refs/tags/v0.38.tar.gz
sha:0c1b19d1a721b995504fc01c21363555f207b25d6749650355a8cd7be09824dd
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/c
lib/config
lib/kernel
lib/curses
lib/parted
lib/e2fsprogs
lib/device/mapper
lib/shim/fake(lib_name=libconfig)
{% endblock %}
