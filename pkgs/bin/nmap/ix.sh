{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
nmap
{% endblock %}

{% block version %}
7.992
{% endblock %}

{% block fetch %}
https://nmap.org/dist/nmap-{{self.version().strip()}}.tar.bz2
0c12660eddbf7eabeff6996cb0c044a4eadf2bb0c6fbcb340d6cf72b1caee402
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/ssh/2
lib/kernel
lib/pcre/2
lib/linear
lib/openssl
{% endblock %}
