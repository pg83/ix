{# the library on the sandbox, whose libc has no time zones and no
   temporary files: libmagic reaches for tzset only to print local dates
   and for mktemp only to spool a file it decompressed through another
   program, neither of which happens to bytes in memory #}

{% extends '//lib/magic/common/ix.sh' %}

{% block cpp_missing %}
${PWD}/ixshim/sandbox.h
{% endblock %}

{% block patch %}
mkdir -p ixshim
cat << 'EOF2' > ixshim/sandbox.h
#pragma once
static inline void tzset(void) {
}
static inline char *mktemp(char *name) {
  if (name) {
    *name = 0;
  }
  return name;
}
EOF2
{% endblock %}
