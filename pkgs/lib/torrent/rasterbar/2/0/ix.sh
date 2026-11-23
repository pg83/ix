{% extends '//lib/torrent/rasterbar/t/ix.sh' %}

{% block pkg_name %}
libtorrent-rasterbar
{% endblock %}

{% block version %}
2.0.16
{% endblock %}

{% block fetch %}
https://github.com/arvidn/libtorrent/releases/download/v{{self.version().strip()}}/libtorrent-rasterbar-{{self.version().strip()}}.tar.gz
8463b8d786141c3923dbf54ab34e5c3312af9913b591239cb0e30f66ead34b9b
{% endblock %}
