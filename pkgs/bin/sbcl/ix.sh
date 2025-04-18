{% extends '//bin/sbcl/t/ix.sh' %}

{% block version %}
2.5.3
{% endblock %}

{% block pkg_name %}
sbcl
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/sbcl/sbcl/{{self.version().strip()}}/sbcl-{{self.version().strip()}}-source.tar.bz2
sha:8a1e76e75bb73eaec2df1ee0541aab646caa1042c71e256aaa67f7aff3ab16d5
{% endblock %}

{% block bld_tool %}
bld/sbcl
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/zstd
lib/gmp/dl
lib/mpfr/dl
{{super()}}
{% endblock %}

{% block boot_lisp %}
sbcl
{% endblock %}
