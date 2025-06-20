{% extends '//lib/llvm/16/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/kernel
{% endblock %}

{% block bld_tool %}
{{super()}}
lib/llvm/20/tblgen
{% endblock %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block cmake_flags %}
{{super()}}
LLVM_ENABLE_PROJECTS="lld;clang"
{% if lib %}
LLVM_ENABLE_RTTI=ON
{% endif %}
{% endblock %}

{% block postinstall %}
{{super()}}
mkdir ${out}/bin
echo > ${out}/bin/lld
{% endblock %}

{% block env %}
{{super()}}
export LLVM_DIR=${out}
export LLVM_MAIN_VERSION=20
export LLVM_FULL_VERSION=20.1
{% endblock %}
