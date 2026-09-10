{% extends '//die/c/make.sh' %}

{% block pkg_name %}
harec
{% endblock %}

{% block version %}
0.26.0
{% endblock %}

{% block fetch %}
https://git.sr.ht/~sircmpwn/harec/archive/{{self.version().strip()}}.tar.gz
5581bc16dcf22969c7d33b0f2a9535ba37d4cf1bb39dec252e98ff2781175629
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block configure %}
cp configs/linux.mk config.mk
{% endblock %}

{% block make_flags %}
ARCH={{target.gnu_arch}}
VERSION={{self.version().strip()}}
{% endblock %}

{% block build_flags %}
no_werror
{% endblock %}
