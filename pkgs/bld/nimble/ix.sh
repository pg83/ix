{% extends '//bin/nim/t/ix.sh' %}

{% block bld_tool %}
bin/nim
{% endblock %}

{% block build %}
cd dist/nimble
nim c --skipUserCfg --noNimblePath --cc:clang \
    --path:${PWD}/../.. \
    --clang.exe:clang --clang.linkerexe:clang \
    --nimcache:${tmp}/nimble --parallelBuild:${make_thrs} \
    -d:release --out:${tmp}/nimble-bin src/nimble.nim
{% endblock %}

{% block patch %}
sed -e 's|from "$nim" / compiler/nimblecmd|from ../../../../compiler/nimblecmd|' \
    -i dist/nimble/src/nimblepkg/tools.nim
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp ${tmp}/nimble-bin ${out}/bin/nimble
{% endblock %}
