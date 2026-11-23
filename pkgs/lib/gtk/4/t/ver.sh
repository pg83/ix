{% block pkg_name %}
gtk
{% endblock %}

{% block version %}
4.24.2
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/{{self.version().strip()}}/gtk-{{self.version().strip()}}.tar.bz2
ca5393fb915b2d19843b1183a6c56a2bb4a63f226c3f17cffb078b28f95fecd9
{% endblock %}
