{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
userspace-rcu
{% endblock %}

{% block version %}
0.15.7
{% endblock %}

{% block fetch %}
https://lttng.org/files/urcu/userspace-rcu-{{self.version().strip()}}.tar.bz2
2556b83adc0f9b3ac8024e613e17d014d04c4c49110604ce55fcb14eae32edd3
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cpp_missing %}
assert.h
{% endblock %}
