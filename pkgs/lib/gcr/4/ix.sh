{% extends '//lib/gcr/t/ix.sh' %}

{% block pkg_name %}
gcr
{% endblock %}

{% block version %}
4.4.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gcr/-/archive/{{self.version().strip()}}/gcr-{{self.version().strip()}}.tar.bz2
e43a0302209dcac2a394590e9487c7acd49de1ddd8a17014a08fb989d0827e5d
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/gtk/4
{% endblock %}

{% block meson_flags %}
vapi=false
{{super()}}
{% endblock %}
