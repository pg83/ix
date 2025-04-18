{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
SCons
{% endblock %}

{% block version %}
4.5.2
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/scons/scons/{{self.version().strip()}}/SCons-{{self.version().strip()}}.tar.gz
sha:ce26aac95d350a79a4192196b0beac3cb24f4ccabce0123eb28d3370f576f072
{% endblock %}

{% block install %}
cd ${out}; mkdir bin; cd bin

extract1 ${src}/SCons*

sed -e "s|= 'ar'| = SCons.Tool.find_program_path(env, 'ar')|" -i SCons/Tool/ar.py

cat << EOF > scons
#!/usr/bin/env sh
PYTHONPATH=${PWD} python3 ${PWD}/SCons/__main__.py "\${@}"
EOF

chmod +x scons
{% endblock %}
