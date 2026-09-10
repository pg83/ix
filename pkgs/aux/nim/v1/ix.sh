{% extends '//aux/fetch/ix.sh' %}

{% block fname %}
nim_v1_{{parent_id}}.pzd
{% endblock %}

{% block bld_tool %}
bin/nim
bld/nimble
bld/git
bld/python
{{super()}}
{% endblock %}

{% block build %}
test -f nimble.lock
cp nimble.lock ${tmp}/nimble.lock
export NIMBLE_DIR=${PWD}/vendored
nimble --accept --useSystemNim --disableNimBinaries --nimbleDir:${NIMBLE_DIR} install --depsOnly
nimble --accept --offline --useSystemNim --disableNimBinaries --nimbleDir:${NIMBLE_DIR} setup
cmp nimble.lock ${tmp}/nimble.lock
base64 -d << EOF > ${tmp}/normalize.py
{% include 'normalize.py/base64' %}
EOF
python3 ${tmp}/normalize.py .
{% endblock %}
