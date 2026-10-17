{% extends '//lib/glaze/ix.sh' %}

# noauto

{% block version %}
9.0.0
{% endblock %}

{% block fetch %}
https://github.com/stephenberry/glaze/archive/refs/tags/v{{self.version().strip()}}.tar.gz
dd7b033c5bf6e4308615bb7834c541291d5b20f64121d9a68222a39414635517
{% endblock %}
