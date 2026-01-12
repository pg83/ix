{% extends 't/ix.sh' %}

{% block make_target %}
so
{% endblock %}

{% block make_install_target %}
soinstall
{% endblock %}

{% block build_flags %}
{{super()}}
wrap_cc
wrap_rdynamic
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
extract_set_space_guess
{% endblock %}
