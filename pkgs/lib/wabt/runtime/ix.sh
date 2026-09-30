{# the wasm2c runtime: the wasm-rt sources wabt ships next to wasm2c, as a
   static library. The C wasm2c generates and the runtime have to agree on
   the runtime's shape, which is a set of defines, so the shape is fixed
   here and exported to consumers through CPPFLAGS: the generated code
   and the embedder get it by depending on this library.

   The shape is the suite's: bounds checks in the generated code, not
   guard pages, so no signal handler is involved; the memory mapped so its
   base never moves; the call depth counted instead of a stack guard. A
   trap goes to trap_handler when one is named, a function the embedder
   defines that must not return (the suite throws from it); without one
   the runtime longjmps to wasm_rt_impl_try(). #}

{% extends '//die/c/ix.sh' %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/wabt
{% endblock %}

{% block cpp_defines %}
WASM_RT_USE_MMAP=1
WASM_RT_MEMCHECK_BOUNDS_CHECK=1
WASM_RT_MEMCHECK_GUARD_PAGES=0
WASM_RT_MAX_CALL_STACK_DEPTH=250
{% if trap_handler %}
WASM_RT_TRAP_HANDLER={{trap_handler}}
{% endif %}
{% endblock %}

{% block unpack %}
mkdir src; cd src
{% endblock %}

{% block build %}
test -n "${WABT_WASM2C_RUNTIME}" || { echo 'bld/wabt exports no WABT_WASM2C_RUNTIME'; exit 1; }
cp "${WABT_WASM2C_RUNTIME}"/wasm-rt* .

for f in wasm-rt-*.c; do
    ${CC} ${CPPFLAGS} ${CFLAGS} -c ${f}
done

ar rcs libwasm-rt.a *.o
{% endblock %}

{% block install %}
mkdir -p ${out}/lib ${out}/include
cp libwasm-rt.a ${out}/lib/
cp wasm-rt.h wasm-rt-impl.h wasm-rt-exceptions.h ${out}/include/
{% endblock %}

{% block env %}
export CPPFLAGS="{% for d in self.cpp_defines() | parse_list %}-D{{d}} {% endfor %}\${CPPFLAGS}"
{% endblock %}
