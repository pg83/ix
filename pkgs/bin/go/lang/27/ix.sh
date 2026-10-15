{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.27.2
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
16231c4a4912f4b97da47995846e1c74117b9d2d158e029fea01b5800af5da85
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/26
{% endblock %}
