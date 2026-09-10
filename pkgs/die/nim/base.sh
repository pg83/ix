{% extends '//die/c/ix.sh' %}

{% block std_box %}
bin/nim
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block build_flags %}
no_werror
{% endblock %}

{% block nim_cpu %}
{{{'x86_64': 'amd64', 'aarch64': 'arm64', 'armv7': 'arm'}.get(target.gnu_arch, target.gnu_arch)}}
{% endblock %}

{% block nim_os %}
{{{'darwin': 'macosx', 'mingw32': 'windows'}.get(target.os, target.os)}}
{% endblock %}

{% block nim_flags %}
-d:release
{% endblock %}

{% block setup_tools %}
{{super()}}
cat << EOF > nimcc
#!/usr/bin/env sh
exec $(command -v nim) c --skipUserCfg --noNimblePath \
    --cc:clang --clang.exe:$(command -v cc) --clang.linkerexe:$(command -v cc) \
    --{{self.nim_cpu().strip()}}.{{self.nim_os().strip()}}.clang.exe:$(command -v cc) \
    --{{self.nim_cpu().strip()}}.{{self.nim_os().strip()}}.clang.linkerexe:$(command -v cc) \
    --cpu:{{self.nim_cpu().strip()}} --os:{{self.nim_os().strip()}} \
    --nimcache:${tmp}/nimcache --parallelBuild:${make_thrs} \
    {{self.nim_flags() | fix_list}} "\${@}"
EOF
chmod +x nimcc
{% if self.host_libs().strip() %}
cat << EOF > nimhost
#!/usr/bin/env sh
exec $(command -v nim) c --skipUserCfg --noNimblePath \
    --cc:clang --clang.exe:${HOST_CC} --clang.linkerexe:${HOST_CC} \
    --nimcache:${tmp}/nimcache-host --parallelBuild:${make_thrs} \
    -d:release "\${@}"
EOF
chmod +x nimhost
{% endif %}
{% endblock %}
