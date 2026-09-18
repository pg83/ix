{% extends '//die/c/ix.sh' %}

{% block fname %}
nim_v1_{{parent_id}}.pzd
{% endblock %}

{% block bld_tool %}
bin/nim
bld/nimble
bld/git
bld/python
bld/fetch
bld/extract
bld/pzd/ser
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block use_network %}true{% endblock %}
{% block use_isolate %}false{% endblock %}

{% block predict_outputs %}
[{"path": "share/{{self.fname().strip()}}", "sum": "{{sha}}"}]
{% endblock %}

{% block step_unpack %}
set -xue
mkdir net
cd net
fetch "{{url}}" "{{fetch_sha or '__skip__'}}"
cd ..
mkdir src
cd src
extract 1 ../net/*
{% if refine_unpack %}
{{refine_unpack | b64d}}
{% endif %}
{% endblock %}

{% block build %}
test -f nimble.lock
cp nimble.lock ${tmp}/nimble.lock
export NIMBLE_DIR=${PWD}/vendored
nimble --accept --useSystemNim --disableNimBinaries --nimbleDir:${NIMBLE_DIR} \
    install --depsOnly --cc:clang --clang.exe:cc --clang.linkerexe:cc
nimble --accept --offline --useSystemNim --disableNimBinaries --nimbleDir:${NIMBLE_DIR} setup
cmp nimble.lock ${tmp}/nimble.lock
base64 -d << EOF > ${tmp}/normalize.py
{% include 'normalize.py/base64' %}
EOF
python3 ${tmp}/normalize.py .
{% endblock %}

{% block step_build %}
{{super()}}
{% if refine %}
{{refine | b64d}}
{% endif %}
cd ..
stable_pack_v3 {{sha}} ${tmp}/{{self.fname().strip()}} src
{% endblock %}

{% block install %}
mkdir ${out}/share
mv ${tmp}/{{self.fname().strip()}} ${out}/share/
ls -la ${out}/share/
sha256sum ${out}/share/*
{% endblock %}

{% block env %}
export src="${out}/share"
{% endblock %}
