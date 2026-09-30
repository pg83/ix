{# wasm simd128 for the whole target: v128 in the code, so highway takes
   its HWY_WASM target and clang vectorizes. A module with v128 needs a
   runtime that has it: wasm2c through lib/wabt/runtime (simde), WAMR
   only in its LLVM modes #}

{% extends '//die/env.sh' %}

{% block env %}
export CFLAGS="-msimd128 ${CFLAGS}"
export CXXFLAGS="-msimd128 ${CXXFLAGS}"
{% endblock %}
