{% block pkg_name %}
solo
{% endblock %}

{% block version %}
11
{% endblock %}

{% block fetch %}
https://github.com/pg83/solo/archive/refs/tags/{{self.version().strip()}}.tar.gz
3dee82eeecb705b1b588502091cc1a615c7b4c71dec7a74376fb9706b72e6a7a
{% endblock %}
