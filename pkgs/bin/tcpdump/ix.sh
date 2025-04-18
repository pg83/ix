{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
tcpdump
{% endblock %}

{% block version %}
4.99.4
{% endblock %}

{% block fetch %}
https://www.tcpdump.org/release/tcpdump-{{self.version().strip()}}.tar.gz
sha:0232231bb2f29d6bf2426e70a08a7e0c63a0d59a9b44863b7f5e2357a6e49fea
{% endblock %}

{% block lib_deps %}
lib/c
lib/pcap
{% endblock %}
