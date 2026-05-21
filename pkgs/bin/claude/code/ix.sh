{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
claude-code
{% endblock %}

{% block version %}
2.1.145
{% endblock %}

{% block fetch %}
https://downloads.claude.ai/claude-code-releases/{{self.version().strip()}}/linux-x64/claude
b3ffbc12689bfe81389d6577787fcea4cab81bd3b6bba9b719e73770b62d720e
{% endblock %}

{% block bld_tool %}
bin/patch/elf
{% endblock %}

{% block step_unpack %}
:
{% endblock %}

{% block install %}
mkdir -p ${out}/bin

install -Dm755 ${src}/claude ${out}/bin/claude.bin

# the prebuilt binary is a 234MB non-PIE bun executable; patchelf can only
# rewrite PT_INTERP safely when the new path is no longer than the original
# (/lib64/ld-linux-x86-64.so.2, 27 chars) — a longer path forces a segment
# relocation that corrupts it. /bin/ld-linux.so.2 (from bin/glibc in the
# system realm) is short, so this is an in-place edit. running the binary
# directly keeps /proc/self/exe == claude, so its self-spawns work.
patchelf --set-interpreter /bin/ld-linux.so.2 ${out}/bin/claude.bin

# thin wrapper: only sets the glibc search path, then execs the real binary
# directly (NOT via ld.so), so the kernel execs claude and execPath is correct
cat << EOF > ${out}/bin/claude.exe
#!/usr/bin/env sh
set -eu
export LD_LIBRARY_PATH="/bin/usr/lib\${LD_LIBRARY_PATH:+:\${LD_LIBRARY_PATH}}"
exec "${out}/bin/claude.bin" "\$@"
EOF

chmod +x ${out}/bin/claude.exe
{% endblock %}

{% block postinstall %}
:
{% endblock %}
