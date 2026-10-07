{# DjVuLibre's library alone: libdjvulibre, the DjVu codec behind the
   ddjvuapi.h C API and the C++ classes under it. The tools are
   bin/djvulibre's. The library wants libjpeg and threads, none of the
   tools' tiff, and none of the desktop files, whose build wants gzip. #}

{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
djvu
{% endblock %}

{% block version %}
3.5.29
{% endblock %}

{% block fetch %}
http://downloads.sourceforge.net/djvu/djvulibre-{{self.version().strip()}}.tar.gz
d3b4b03ae2bdca8516a36ef6eb27b777f0528c9eda26745d9962824a3fdfeccf
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/jpeg
{% endblock %}

{% block cxx_flags %}
{{super()}}
-Wno-register
{% endblock %}

{% block configure_flags %}
--disable-xmltools
--disable-desktopfiles
{% endblock %}

{# the library's directory alone, built and installed: the C API's
   headers and its pkg-config file are its #}
{% block make_flags %}
-C libdjvu
{% endblock %}

{# the C++ classes go out too, with the config.h they were built with,
   for a consumer that drives the library below its C API #}
{% block install %}
{{super()}}
cp config.h libdjvu/*.h ${out}/include/libdjvu/
{% endblock %}
