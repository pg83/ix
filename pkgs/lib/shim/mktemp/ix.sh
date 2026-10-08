{# mktemp for a sandbox whose libc has no temporary files: <stdlib.h> as
   the libc has it, and a mktemp that makes no name. A library reaches for
   it only to spool a file it decompressed through another program, which
   does not happen to bytes in memory. #}

{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/include
cat << EOF > ${out}/include/stdlib.h
{% include 'stdlib.h' %}
EOF
{% endblock %}
