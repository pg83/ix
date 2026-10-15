{% block version %}
5.0.0-beta8
{% endblock %}

{% block pkg_name %}
premake
{% endblock %}

{% block fetch %}
https://github.com/premake/premake-core/archive/refs/tags/v{{self.version().strip()}}.tar.gz
2a55195fd2b27e5aa3de8ff6d22cdb127232a86f801d06e7f673d30a0eba09ac
{% endblock %}
