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

{% extends '//die/inline/program.sh' %}

{% block lib_deps %}
lib/c
lib/dlfcn(libdlfcn_ver=elf)
{% endblock %}

{% block sources %}
stub.c
{% endblock %}

{% block name %}
claude-solo-stub
{% endblock %}

{% block env %}
export CLAUDE_SOLO_STUB="${out}/bin/{{self.name().strip()}}"
{% endblock %}
