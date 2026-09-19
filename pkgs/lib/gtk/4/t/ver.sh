{% block pkg_name %}
gtk
{% endblock %}

{% block version %}
4.22.5
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/{{self.version().strip()}}/gtk-{{self.version().strip()}}.tar.bz2
18a6f83b8f7aad3b5bd153fef0ba6b9ffb6dd8776d64c73d9dbb3acd4fd0fb4b
{% endblock %}
