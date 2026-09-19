{# lib/dlfcn/elf prepared for a solo bundle stub. The loader hands a guest
   executable the ABI slot adjacent to the thread pointer, so the static
   TLS pad must be the thread-pointer-proximal TLS of the stub — a link
   position nobody controls while the pad sits in an archive member. Here
   the member moves out of libdlstub.a into a plain object the stub's link
   line places explicitly: last on x86-64, whose TLS grows down toward the
   pointer, first on aarch64, whose TLS grows up.

   Plain library consumers keep using lib/dlfcn/elf, whose archive stays
   whole; this variant is selected the same way as any other, through
   libdlfcn_ver=solo on the reference. #}

{% extends '//lib/dlfcn/elf/ix.sh' %}

{% block install %}
{{super()}}
ar p ${out}/lib/libdlstub.a musl_tls.c.o > ${out}/lib/solo_musl_tls.o
ar d ${out}/lib/libdlstub.a musl_tls.c.o
{% endblock %}

{% block env %}
{{super()}}
export SOLO_MUSL_TLS_OBJECT="${out}/lib/solo_musl_tls.o"
{% endblock %}
