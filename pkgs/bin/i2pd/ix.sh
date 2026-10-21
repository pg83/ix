{% extends '//die/c/make.sh' %}

{% block pkg_name %}
i2pd
{% endblock %}

{% block version %}
3.0.0
{% endblock %}

{% block fetch %}
https://github.com/PurpleI2P/i2pd/archive/refs/tags/{{self.version().strip()}}.tar.gz
3bebc9567658944d388c382fbec61b7bc583dfa9982028b42b96eeb354f79bd3
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/kernel
lib/openssl
lib/boost/85
{% endblock %}

{% block bld_tool %}
bin/gzip
{% endblock %}
