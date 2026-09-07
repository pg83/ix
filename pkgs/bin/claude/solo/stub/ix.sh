{# The stub half of the bundle: an ordinary static binary that links solo's
   ELF loader and the glibc ABI bridge, and does nothing but hand control to
   the program appended to it.

   This is where a bundle's shape is decided. Every lib/*/dl package listed
   below registers the symbols of a statically linked library under a soname
   through stub_dlregister(), and the loader consults that registry before it
   looks at the bundle or at the machine — so a guest's DT_NEEDED on, say,
   libwayland-client.so.0 is answered by the copy linked in here.

   claude needs none of that: its whole closure is librt, libc, ld-linux,
   libpthread, libdl, and libm, and the ABI bridge serves all six itself. The
   lib_deps block is the one place to grow when a guest needs more. #}

{# NOT YET RUNNABLE. The stub builds and the bundle is produced, but the
   guest refuses to start:

     the executable's TLS (27313 bytes, 16-byte alignment) cannot take the
     ABI slot next to the thread pointer

   A guest executable's local-exec offsets are burned into its instructions
   relative to the thread pointer, so its TLS block has to end exactly
   there, and the loader carves it out of a pad that must therefore be the
   executable's only thread_local. This stub's PT_TLS is 1048656 bytes —
   the 1 MiB pad plus 80 bytes of strays, alignment included:

     _ZZN10__cxxabiv112_GLOBAL__N_19__globalsEvE10eh_globals   16  libc++abi
     _ZN8tcmalloc14ThreadCachePtr9tls_data_E                    8  tcmalloc

   solo's own binary links the same loader and comes out at exactly
   1048576, so this is ix's runtime rather than anything in the loader.
   The allocator is selectable — lib/c/alloc honours allocator= and
   force_allocator= — so tcmalloc's eight bytes can go; libc++abi's
   eh_globals needs its exception storage built against a pthread key
   instead of a thread_local, which is an ix-side build change. #}

{% extends '//die/inline/program.sh' %}

{% block lib_deps %}
lib/c
lib/dlfcn(libdlfcn_ver=elf)
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

{# A non-PIE guest owns its link-time addresses and nothing can relocate
   it, so the stub must not be sitting in them. ix links binaries -static
   and non-PIE, which puts this one at 0x200000 — exactly where claude
   starts, and claude runs to 0x11737000.

   1 GiB is as far out of the way as the small code model allows: its
   R_X86_64_32 relocations cannot reach past 4 GiB, and moving the whole
   closure to -mcmodel=large to buy more room is not worth it. That leaves
   the guest everything below 1 GiB, against the 292 MiB claude occupies
   today. A guest that outgrows that needs this raised, or needs ix to
   grow a static-PIE mode — which is how solo's own binary sidesteps the
   problem entirely. #}
{% block ld_flags %}
-Wl,--image-base=0x40000000
{% endblock %}

{% block name %}
claude-solo-stub
{% endblock %}

{% block env %}
export CLAUDE_SOLO_STUB="${out}/bin/{{self.name().strip()}}"
{% endblock %}
