{% extends '3.4.1_t.sh' %}

{% block bison_patch %}
cp bb/parse-gram.* src/
touch src/*.c src/*.h
{% endblock %}

{% block bison_postconf %}
{% endblock %}
