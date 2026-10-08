{# the password and group databases of a sandbox without users: pwd.h and
   grp.h whose lookups find nobody. A library looks there only to expand ~
   in a path or to find a home. #}

{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/include
cat << EOF > ${out}/include/pwd.h
{% include 'pwd.h' %}
EOF
cat << EOF > ${out}/include/grp.h
{% include 'grp.h' %}
EOF
{% endblock %}
