{# libmagic alone: file's src/ as a library with its pkg-config file, and
   the compiled magic database of aux/magic as the path the library opens
   by default. The tools are bin/file's. #}

{% extends '//lib/magic/t/t/ix.sh' %}

{% block build %}
cd src
{{super()}}
{% endblock %}

{% block install %}
make install-pkgconfigexecDATA
cd src
{{super()}}
{% endblock %}

{% block use_data %}
aux/magic
{% endblock %}

{% block cpp_defines %}
MAGIC=\\\"${MAGIC_DATA}\\\"
{% endblock %}
