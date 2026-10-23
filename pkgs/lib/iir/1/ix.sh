{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
iir1
{% endblock %}

{% block version %}
1.11.0
{% endblock %}

{% block fetch %}
https://github.com/berndporr/iir1/archive/refs/tags/{{self.version().strip()}}.tar.gz
1a0f702f6787d9d38dd54e96ae82a4764766c506eeaff47f84f63eba9b5774e0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
