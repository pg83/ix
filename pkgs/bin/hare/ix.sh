{% extends '//die/c/make.sh' %}

{% block pkg_name %}
hare
{% endblock %}

{% block version %}
0.26.0.1
{% endblock %}

{% block fetch %}
https://git.sr.ht/~sircmpwn/hare/archive/{{self.version().strip()}}.tar.gz
f76704920a2f457be4d2d6290dc10dcfb7319c1d1990f2305491644383466905
{% endblock %}

{% block bld_tool %}
bld/harec
bin/qbe
bin/scdoc
{% endblock %}

{% block run_deps %}
bin/harec
bin/qbe
{% endblock %}

{% block run_data %}
aux/tzdata
{% endblock %}

{% block configure %}
cp configs/linux.mk config.mk
{% endblock %}

{% block setup_compiler %}
{# No C compilation here: use Clang directly with an explicit assembly target. #}
:
{% endblock %}

{% block patch %}
base64 -d << EOF | patch -p1
{% include 'llvm.patch/base64' %}
EOF
# IX installs tzdata under /etc/zoneinfo, not /usr/share/zoneinfo.
sed -e 's|/usr/share/zoneinfo|/etc/zoneinfo|g' -i \
    time/date/+linux.ha time/chrono/+linux.ha
{% endblock %}

{% block make_flags %}
# Only the temporary bootstrap driver is host-native.
ARCH={{host.gnu_arch}}
HARECFLAGS="-a {{host.gnu_arch}}"
QBEFLAGS="-t {{{'x86_64': 'amd64_sysv', 'aarch64': 'arm64', 'riscv64': 'rv64'}[host.gnu_arch]}}"
AS="$(command -v clang)"
ASFLAGS="--target={{host.gnu_arch}}-unknown-linux -c -x assembler"
LD=ld.lld
VERSION={{self.version().strip()}}
{% endblock %}

{% block make_target %}
.bin/hare docs
{% endblock %}

{% block build %}
{{super()}}
mkdir target-bin
for tool in hare haredoc; do
    HAREPATH=. HARECACHE=${tmp}/hare-target \
    AS=clang LD=ld.lld \
    .bin/hare build -a {{target.gnu_arch}} -j ${make_thrs} -R \
        -D 'PLATFORM:str="linux"' \
        -D 'ARCH:str="{{target.gnu_arch}}"' \
        -D 'VERSION:str="{{self.version().strip()}}"' \
        -D "HAREPATH:str=\"${out}/share/hare/stdlib:${out}/share/hare/third-party\"" \
        -D "TOOLDIR:str=\"${out}/libexec/hare\"" \
        -o target-bin/${tool} ./cmd/${tool}
done
{% endblock %}

{% block install %}
mkdir -p ${out}/bin ${out}/share/hare/stdlib ${out}/share/man/man1 ${out}/share/man/man5
cp target-bin/hare target-bin/haredoc ${out}/bin/
cp -R $(sh scripts/moddirs) README ${out}/share/hare/stdlib/
cp docs/*.1 ${out}/share/man/man1/
cp docs/*.5 ${out}/share/man/man5/
{% endblock %}
