{% extends 't/ix.sh' %}

{% block bld_tool %}
bld/nim
{% endblock %}

{% block build %}
nim c --skipUserCfg --skipParentCfg --noNimblePath \
    --lib:${PWD}/lib --nimcache:${tmp}/nimcache \
    --cc:clang --clang.exe:clang --clang.linkerexe:clang \
    --{{self.nim_cpu().strip()}}.{{self.nim_os().strip()}}.clang.exe:clang \
    --{{self.nim_cpu().strip()}}.{{self.nim_os().strip()}}.clang.linkerexe:clang \
    --cpu:{{self.nim_cpu().strip()}} --os:{{self.nim_os().strip()}} \
    --parallelBuild:${make_thrs} -d:release \
    --out:bin/nim{{target.exe_suffix}} compiler/nim.nim
{% endblock %}
