{% extends '//bin/go/lang/20/ix.sh' %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go1.22.9.tar.gz
sha:5b77fa05205714383f35491150e8cc9dc849ad73aef634f7b7ac4854e44ecde1
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/21
{% endblock %}
