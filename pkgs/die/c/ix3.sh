{% extends 'ix2.sh' %}

{% block script_functions %}
{{super()}}
setup_host_flags_f() (
{% block setup_host_flags %}
{% endblock %}
    source_env "${IX_H_DIR}"
    setup_tc host
)
{% endblock %}

{% block setup_host_tc %}
{% if self.host_libs().strip() %}
setup_host_flags_f
export HOST_CC=${PWD}/host/cc
export HOST_CXX=${PWD}/host/c++
export HOST_AR=${PWD}/host/ar
export HOST_NM=${PWD}/host/nm
export HOST_RANLIB=${PWD}/host/ranlib
{% else %}
echo 'skip host toolchain'
{% endif %}
{% endblock %}

{% block setup_target_tc %}
source_env "${IX_T_DIR}"

# yep, THE ONLY place for this shit
pushd ${bld}
{% block setup_target %}
{% endblock %}
popd

setup_tc target

export CFLAGS=
export LDFLAGS=
export CTRFLAGS=
export CPPFLAGS=
export CXXFLAGS=
export CONLYFLAGS=

for x in cc gcc c99 clang; do
    ln -s target/cc ${x}
done

for x in c++ g++ clang++; do
    ln -s target/c++ ${x}
done

for x in cpp clang-cpp; do
    ln -s target/preproc ${x}
done

for x in ar nm ranlib; do
    ln -s target/${x} ${x}
done
{% endblock %}
