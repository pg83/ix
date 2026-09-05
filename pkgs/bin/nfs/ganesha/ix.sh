{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
nfs-ganesha
{% endblock %}

{% block version %}
15.3
{% endblock %}

{% block git_repo %}
https://github.com/nfs-ganesha/nfs-ganesha
{% endblock %}

{% block git_branch %}
V{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
6bb852e9f816775c6084485f1da5b6f4e088c40b0d34076b4dcfc9dd36835bbc
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/acl
lib/dbus
lib/openssl
lib/urcu
lib/kernel
lib/ntirpc
lib/execinfo
lib/linux/util
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block step_unpack %}
{{super()}}
cd src
{% endblock %}

{% block cmake_flags %}
USE_GSS=OFF
USE_MONITORING=OFF
USE_SYSTEM_NTIRPC=ON
NTIRPC_INCLUDE_DIR=${NTIRPC_PREFIX}/include/ntirpc
NTIRPC_LIBRARY_DIR=${NTIRPC_PREFIX}/lib
{% endblock %}

{% block patch %}
sed -e 's|typedef.*_t;||' -i include/nlm4.h include/cqos.h
sed -e 's|__gid_t|gid_t|g' -i idmapper/pwnam_wrappers.c
sed -e 's|add_executable(sm_notify.ganesha |add_executable(sm_notify.ganesha EXCLUDE_FROM_ALL |' -i CMakeLists.txt
#sed -e 's|innetgr.*;|0;|' -i support/netgroup_cache.c
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
wrap_rdynamic
{% endblock %}
