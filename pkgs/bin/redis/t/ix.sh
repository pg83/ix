{% extends '//die/c/make.sh' %}

{% block pkg_name %}
redis
{% endblock %}

{% block version %}
8.12.0
{% endblock %}

{% block fetch %}
https://github.com/redis/redis/archive/refs/tags/{{self.version().strip()}}.tar.gz
07e2477372566acf587e32c1abc8af088ad901fb2c725388ec9a5bef29c47319
{% endblock %}

{% block bld_libs %}
lib/c
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block unpack %}
{{super()}}
cd src
{% endblock %}

{% block patch %}
# Redis only consumes xxHash's static archive.
sed -i 's/$(MAKE) lib CFLAGS=/$(MAKE) libxxhash.a CFLAGS=/' ../deps/Makefile
# The default target builds test modules that are not installed.
sed -i 's/ $(TLS_MODULE) module_tests/ $(TLS_MODULE)/' Makefile
{% endblock %}

{% block make_flags %}
MALLOC=libc
USE_SYSTEMD=no
{% endblock %}

{% block c_flags %}
-Wno-strict-prototypes
{% endblock %}
