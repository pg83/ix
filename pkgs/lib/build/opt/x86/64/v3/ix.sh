{% extends '//die/env.sh' %}

{# x86-64-v3: AVX2, BMI1/2, FMA, F16C, LZCNT, MOVBE. The cc wrapper puts
   CFLAGS on C++ links too, so one export covers both compilers. #}
{% block env %}
export CFLAGS="-march=x86-64-v3 ${CFLAGS}"
{% endblock %}
