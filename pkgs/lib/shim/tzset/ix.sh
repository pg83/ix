{# tzset for a sandbox whose libc has no time zones: <time.h> as the libc
   has it, and a tzset that sets nothing. A library reaches for it only to
   print local dates. #}

{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/include
cat << EOF > ${out}/include/time.h
{% include 'time.h' %}
EOF
{% endblock %}
