{% extends '//lib/gcr/t/mix.sh' %}

{% block meson_flags %}
gtk=false
{{super()}}
{% endblock %}
