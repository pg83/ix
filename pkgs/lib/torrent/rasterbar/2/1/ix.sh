{% extends '//lib/torrent/rasterbar/t/ix.sh' %}

{% block pkg_name %}
libtorrent-rasterbar
{% endblock %}

{% block version %}
2.1.3
{% endblock %}

{% block fetch %}
https://github.com/arvidn/libtorrent/releases/download/v{{self.version().strip()}}/libtorrent-rasterbar-{{self.version().strip()}}.tar.gz
de05681acc564651211b4351af7d633a7a225587f0604611d657729dec299ae6
{% endblock %}
