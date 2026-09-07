{# The stub half of the bundle: an ordinary static binary that links solo's
   ELF loader and the glibc ABI bridge, and does nothing but hand control to
   the program appended to it.

   This is where a bundle's shape is decided. Every lib/<name>/dl package
   listed below registers the symbols of a statically linked library under a
   soname through stub_dlregister(), and the loader consults that registry
   before it looks at the bundle or at the machine — so a guest's DT_NEEDED
   on, say, libwayland-client.so.0 is answered by the copy linked in here.

   claude needs none of that: its whole closure is librt, libc, ld-linux,
   libpthread, libdl, and libm, and the ABI bridge serves all six itself.
   The lib_deps block is the one place to grow when a guest needs more.

   Two placement rules keep the result runnable. The TLS pad object from
   lib/dlfcn/elf must sit adjacent to the thread pointer, where a guest
   executable's local-exec offsets point: last on the x86-64 link line,
   whose TLS grows down toward the pointer, first on aarch64, whose TLS
   grows up — the setup_target/ld_flags blocks below put it there, after
   every dependency's flags are assembled and before the compiler wrapper
   bakes them, so no dependency order can unseat it. And the stub links at
   1 GiB, out of the fixed addresses a non-PIE guest owns —
   claude occupies 0x200000 through 0x11737000, ix's default non-PIE link
   starts at 0x200000, and the small code model's 32-bit relocations allow
   nothing past 4 GiB. #}

{% extends '//die/inline/program.sh' %}

{# lib/c already carries lib/dlfcn; which implementation it resolves to is
   decided by the libdlfcn_ver flag on the reference to this package —
   bin/claude/solo passes elf — and rides down the whole closure. #}
{% block lib_deps %}
lib/c
{% endblock %}

{% block sources %}
stub.c
{% endblock %}

{# musl's dlfcn.h defines _DLFCN_H but only declares Dl_info under
   _GNU_SOURCE, and the loader's header skips its own typedef whenever
   _DLFCN_H is set — so without this the two disagree about Dl_info and
   stub_dladdr fails to declare. The loader's own sources are compiled with
   it for the same reason. #}
{% block cpp_defines %}
_GNU_SOURCE
{% endblock %}

{% block ld_flags %}
{% if x86_64 %}
-Wl,--image-base=0x40000000
{% else %}
${SOLO_MUSL_TLS_OBJECT}
{% endif %}
{% endblock %}

{% block setup_target %}
{{super()}}
{% if x86_64 %}
export LDFLAGS="${LDFLAGS} ${SOLO_MUSL_TLS_OBJECT}"
{% endif %}
{% endblock %}

{% block name %}
claude-solo-stub
{% endblock %}

{% block env %}
export CLAUDE_SOLO_STUB="${out}/bin/{{self.name().strip()}}"
{% endblock %}
