{% extends '//lib/ng/http/2/t/mix.sh' %}

{% block configure_flags %}
{{super()}}
--enable-lib-only
{% endblock %}
