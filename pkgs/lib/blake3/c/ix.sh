{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
BLAKE3
{% endblock %}

{% block version %}
1.8.8
{% endblock %}

{% block fetch %}
https://github.com/BLAKE3-team/BLAKE3/archive/refs/tags/{{self.version().strip()}}.tar.gz
a5b927e875e16ebe76bacc1961107d2135637aab39ef227006fea27634e94cfe
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd c
{% endblock %}
