{# the library on the sandbox, whose libc has no time zones and no
   temporary files: libmagic reaches for tzset only to print local dates
   and for mktemp only to spool a file it decompressed through another
   program, neither of which happens to bytes in memory. The shims stand
   first: the first library listed is the first on the include path, and
   theirs are the headers that go ahead of the libc's. #}

{% extends '//lib/magic/common/ix.sh' %}

{% block lib_deps %}
{% endblock %}

{% block bld_libs %}
lib/shim/tzset
lib/shim/mktemp
lib/c
{% endblock %}
