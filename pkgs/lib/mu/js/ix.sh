{% extends '//die/c/make.sh' %}

{#
/ix/store/9wSuGHsxpXbosjt7KKWhG1-bin-dash-sh/bin/sh: 1: curl: not found
make: *** [Makefile:76: UnicodeData.txt] Error 127
make: *** Waiting for unfinished jobs....
/ix/store/9wSuGHsxpXbosjt7KKWhG1-bin-dash-sh/bin/sh: 1: curl: not found
make: *** [Makefile:78: SpecialCasing.txt] Error 127
/ix/store/9wSuGHsxpXbosjt7KKWhG1-bin-dash-sh/bin/sh: 1: curl: not found
make: *** [Makefile:76: UnicodeData.txt] Error 127
#}

{% block pkg_name %}
mujs
{% endblock %}

{% block version %}
1.3.10
{% endblock %}

{% block fetch %}
https://mujs.com/downloads/mujs-{{self.version().strip()}}.tar.gz
6e36c15dbb84ff859320297c900852f241b131a7b6ddaea669ac9a65bd75571c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block make_flags %}
HAVE_READLINE=no
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|Version:.*|Version: {{self.version().strip()}}|' \
    -i ${out}/lib/pkgconfig/mujs.pc
{% endblock %}
