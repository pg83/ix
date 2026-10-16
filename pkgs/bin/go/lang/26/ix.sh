{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.26.9
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
fc7e1c5fa90555a420db48f8044fa98e9b4512defceb5c665905d85bdca7ddc8
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/25
{% endblock %}
