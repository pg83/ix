{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://lttng.org/files/urcu/userspace-rcu-0.14.1.tar.bz2
sha:231acb13dc6ec023e836a0f0666f6aab47dc621ecb1d2cd9d9c22f922678abc0
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cpp_missing %}
assert.h
{% endblock %}
