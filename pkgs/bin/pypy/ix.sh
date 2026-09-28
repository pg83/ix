{# PyPy with the JIT, and with its cffi stdlib modules linked in.

   Upstream builds those after translation, as shared objects loaded
   by dlopen. Here each one is an archive from lib/pypy/cffi, linked
   into the binary, with its entry point registered in the dl table by
   the matching /dl package, and named here so the frozen importlib
   knows to look for it there rather than on disk. #}

{% extends 't/ix.sh' %}

{% block pypy_opt %}
jit
{% endblock %}

{% block pypy_cffi_libs %}
lib/pypy/cffi/pwdgrp/dl
lib/pypy/cffi/resource/dl
lib/pypy/cffi/syslog/dl
lib/pypy/cffi/posix/shmem/dl
lib/pypy/cffi/lzma/dl
{% endblock %}

{% block pypy_cffi_modules %}
_pwdgrp_cffi
_resource_cffi
_syslog_cffi
_posixshmem_cffi
_lzma_cffi
{% endblock %}
