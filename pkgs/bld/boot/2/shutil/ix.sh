{% extends '//die/py.py' %}

{% block fetch %}
https://github.com/pg83/shutil/archive/refs/tags/v1.tar.gz
sha:67825e48717c64c2d46d785cfcf46c997b6636cfc5693e34f4d1598aa5ea974a
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/1/env
{% endblock %}

{% block script %}
extract0 ${src}/*.gz; cd shutil*

export PATH="${PWD}:${PATH}"

setup_compiler
setup_ar

. build.sh

cat << EOF > mv.c
#include <stdio.h>

int main(int argc, char** argv) {
    if (argc > 2) {
        rename(argv[1], argv[2]);
    }

    return 0;
}
EOF

${CC} ${CFLAGS} ${CPPFLAGS} ${LDFLAGS} -o mv mv.c

cat << EOF > uname.c
#include <stdio.h>

int main() {
    printf("{{target.cmake_system_name}}\n");
    return 0;
}
EOF

${CC} ${CFLAGS} ${CPPFLAGS} ${LDFLAGS} -o uname uname.c

cp() (
    cat ${1} > ${2}
    chmod ${2}
)

mkdir ${out}/bin

for i in mkdir cat tr dirname echo chmod rm test mv uname; do
    cp ${i} ${out}/bin/${i}
done
{% endblock %}
