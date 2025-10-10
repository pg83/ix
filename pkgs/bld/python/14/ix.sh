{% extends '//lib/python/3/14/t/t/ix.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/ffi
lib/expat
lib/bzip/2
lib/py/extra
lib/mpdecimal
{% endblock %}

{% block ensure_static_build %}
{{super()}}
cat Modules/Setup.local \
    | grep -v _dbm      \
    | grep -v _gdbm     \
    | grep -v readline  \
    | grep -v _ssl      \
    | grep -v _curses   \
    | grep -v _decimal  \
    | grep -v _sqlite   \
    | grep -v _zstd   \
    | grep -v _hashopenssl > _
mv _ Modules/Setup.local
{% endblock %}

{% block env %}
{{super()}}
export NATIVE_PYTHON=${out}/bin/python3
{% endblock %}
