{% extends '//die/c/ix.sh' %}

{% include 'ver.sh' %}

{% block fetch %}
{{self.fetch_impl()}}
{% endblock %}

{% block unpack %}
{{super()}}
cd nss
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/nspr
lib/sqlite/3
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block build_flags %}
wrap_cc
shut_up
{% endblock %}

{% block bld_tool %}
bld/gyp
bld/perl
bld/bash
bld/ninja
bld/python
bld/redir(from=python,to=python3)
bin/binutils(for_target={{target.gnu.three}})
{% endblock %}

{% block build %}
bash build.sh -v -j ${make_thrs} \
    --clang --gyp \
    --disable-tests \
    --static \
    --system-nspr \
    --system-sqlite \
    -Duse_system_zlib=1 \
    -Ddisable_fips=1 \
    -Dsign_libs=0
{% endblock %}

{% block install %}
cp -R ../dist/Debug/* ${out}/
{% endblock %}

{% block patch %}
sed -e 's|SECKEY_PQGParamsTemplate|SECKEY_PQGParamsTemplate_xxx|' -i cmd/certutil/keystuff.c
sed -e 's|CERT_OidSeqTemplate|CERT_OidSeqTemplate_xxx|' -i cmd/certutil/certext.c
{% endblock %}
