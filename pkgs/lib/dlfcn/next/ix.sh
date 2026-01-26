{% extends '//lib/dlfcn/t/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/std/naked
{% endblock %}

{% block step_unpack %}
base64 -d << EOF > dlfcn.h
{% include 'dlfcn.h/base64' %}
EOF
base64 -d << EOF > dlfcn.cpp
{% include 'dlfcn.cpp/base64' %}
EOF
base64 -d << EOF > Makefile
{% include 'Makefile/base64' %}
EOF
{% endblock %}

{% block c_flags %}
-std=c++2a
{% endblock %}
