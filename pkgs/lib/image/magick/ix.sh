{% extends '//lib/image/magick/t/ix.sh' %}

{% block configure_flags %}
{{super()}}
--without-utilities
{% endblock %}
