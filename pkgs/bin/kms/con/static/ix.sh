{% extends '//bin/kms/con/stock/ix.sh' %}

# check bin/kms/con

{% block bld_tool %}
{{super()}}
bld/dlfcn
bld/relink
{% endblock %}

{% block build_flags %}
{{super()}}
wrap_cc
wrap_rdynamic
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|void kmscon_load_modules|void kmscon_load_modules_xxx|' \
    -i src/kmscon_module.c
cat << EOF >> src/kmscon_module.c
static void load1(const char* name) {
    struct kmscon_module* mod;
    mod = 0;
    kmscon_module_open(&mod, name);
    if (mod && kmscon_module_load(mod) == 0) {
        shl_dlist_link(&module_list, &mod->list);
    }
}

void kmscon_load_modules(void) {
    load1("mod-bbulk");
    load1("mod-gltex");
    load1("mod-pango");
    load1("mod-pixman");
    load1("mod-unifont");
}
EOF
{% endblock %}

{% block build %}
{{super()}}
cd ${tmp}/obj/src
ls mod*.a | while read l; do
    mn=$(echo ${l} | sed -e 's|mod-||' | sed -e 's|\.a||')
    llvm-objcopy --redefine-sym=module=${mn}_module ${l}
    echo "mod-${mn} module ${mn}_module"
done | dl_stubs > stubs.c
cat stubs.c
relink kmscon -- ${PWD}/stubs.c
{% endblock %}
