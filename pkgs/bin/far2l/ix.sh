{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/elfmz/far2l/archive/refs/tags/v_2.5.2.tar.gz
sha:c8ae8bd7b9f242e267f4b13c81735706accdc40046dd262d30a4017b703f36b7
{% endblock %}

{% block bld_libs %}
lib/c
lib/fmt
lib/ssh
lib/pcre
lib/magic
lib/spdlog
lib/kernel
lib/archive
lib/xerces/c
lib/uchardet
lib/execinfo/fake
{% endblock %}

{% block bld_tool %}
bld/m4
bld/perl
bld/dlfcn
bld/pkg/config
{% endblock %}

{% block c_rename_symbol %}
Ppmd8_Free
Ppmd8_Init
Ppmd8_Alloc
Ppmd8_Update2
Ppmd8_Update1
Ppmd8_Update1_0
Ppmd8_Construct
Ppmd8_UpdateBin
PPMD8_kExpEscape
Ppmd8_MakeEscFreq
Ppmd8_DecodeSymbol
Ppmd8_RangeDec_Init
{% endblock %}

{% block cpp_includes %}
${PWD}
{% endblock %}

{% block cmake_flags %}
USEWX=no
{% endblock %}

{% block patch %}
cat << EOF | dl_stubs >> far2l/src/init.c
c GetPathTranslationPrefix GetPathTranslationPrefix
c GetPathTranslationPrefixA GetPathTranslationPrefixA
EOF

find . -type f | while read l; do
    sed -e 's|src/main.cpp|src/main.cpp src/init.c|' -i ${l}
done
{% endblock %}
