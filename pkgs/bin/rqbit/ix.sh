{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/ikatson/rqbit/archive/refs/tags/v8.0.0.tar.gz
{% endblock %}

{% block cargo_sha %}
2f867685a41e545f71a37ec415b4f2fea689db2741dac7eaa523d30d334cff97
{% endblock %}

{% block cargo_ver %}
v4
{% endblock %}

{% block cargoc_ver %}
83
{% endblock %}

{% block cargo_refine %}
make webui-deps
(
cd crates/librqbit/webui
npm install --save --save-exact rollup@npm:@rollup/wasm-node
)
{% endblock %}

{% block cargo_refine_tools %}
bld/npm
bld/make
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/npm
bld/de/bloat
bin/esbuild/21
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/rqbit ${out}/bin/
{% endblock %}

{% block bld_libs %}
lib/openssl
{% endblock %}

{% block patch %}
find . -name esbuild -type f | while read l; do
    echo > ${l}
done
debloat ${PWD}
find . -name esbuild -type f | while read l; do
    rm ${l}
    cp $(command -v esbuild) ${l}
done
{% endblock %}
