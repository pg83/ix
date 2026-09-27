{# Host CPython 2 for the RPython translator.

   rpython imports ctypes on the way in: rlib/rthread casts through
   ll2ctypes, whose _setup_ctypes_cache() reaches straight for
   ctypes.c_long. The stock bld/python/2 has no _ctypes, so the
   translation dies before it starts. Everything else it needs is
   already there. #}

{% extends '//bld/python/2/ix.sh' %}

{% block pkg_name %}
python2-pypy
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/ffi
{% endblock %}

{% block patch %}
{{super()}}
cat << EOF >> Modules/Setup.local
_ctypes _ctypes/_ctypes.c _ctypes/callbacks.c _ctypes/callproc.c _ctypes/stgdict.c _ctypes/cfield.c
EOF
{% endblock %}
