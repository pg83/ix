{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/laurikari/tre/archive/refs/tags/v0.9.0.tar.gz
sha:5b7e5a730f041c6b0dab8f66576cda917577ec06bb393f156b169c51bca170d1
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
