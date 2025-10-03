{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/include
cat << EOF > ${out}/include/regex.h
#pragma once

typedef int regex_t;

#define REG_EXTENDED 0
#define REG_NOSUB 0
#define REG_NOMATCH 1

static inline int regcomp(regex_t* r, const char* s, int f) {
    return 0;
}

static inline int regexec(regex_t* r, const char* s, int n, void* p, int f) {
    return 2;
}

static inline void regfree(regex_t* r) {
}

static inline size_t regerror(int errcode, const regex_t* r, char* errbuf, size_t errbuf_size) {
    return snprintf(errbuf, errbuf_size, "regerror (%d)", errcode);
}
EOF
{% endblock %}
