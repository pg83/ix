{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/npm/cli/archive/refs/tags/v9.8.0.tar.gz
sha:7a6c27c9c0fe6f39069365c33a93e43f5ae2b09f80943ec9309240f809440128
{% endblock %}

{% block use_network %}true{% endblock %}

{% set sum %}a7eda19befd096018b45f6b59{% endset %}

{% block predict_outputs %}
[{"path": "share/npm.pzd", "sum": "{{sum}}"}]
{% endblock %}

{% block bld_tool %}
bld/pzd
bin/nodejs
{% endblock %}

{% block build %}
node workspaces/arborist/bin/index.js reify
node bin/npm-cli.js install
rm -rf undefined
stable_pack_v3 {{sum}} ${tmp}/npm.pzd .
{% endblock %}

{% block install %}
mkdir ${out}/share
mv ${tmp}/npm.pzd ${out}/share/
{% endblock %}

{% block env %}
export src=${out}/share/npm.pzd
{% endblock %}
