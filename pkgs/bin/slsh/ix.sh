{% extends '//lib/slang/ix.sh' %}

{% block bld_libs %}
lib/readline
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-readline=gnu
{% endblock %}
