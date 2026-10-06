{# DjVuLibre: the DjVu codec and its tools. On wasm32-none the library
   alone, single-threaded and without C++ exceptions: the decoder's
   thread runs on the caller's through lib/shim/pthread, and the library's
   G_TRY/G_THROW become a trap of the instance, which the host drops; the
   library throws only on broken data, a sound file in memory never does. #}

{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
djvu
{% endblock %}

{% block version %}
3.5.29
{% endblock %}

{% block fetch %}
http://downloads.sourceforge.net/djvu/djvulibre-{{self.version().strip()}}.tar.gz
d3b4b03ae2bdca8516a36ef6eb27b777f0528c9eda26745d9962824a3fdfeccf
{% endblock %}

{# on the sandbox the library's threads are the shim's, and whoever links
   the library links the shim #}
{% block lib_deps %}
lib/c
lib/c++
lib/jpeg
{% if wasi %}
lib/shim/pthread
{% else %}
lib/tiff
{% endif %}
{% endblock %}

{# libjpeg's error exit is a longjmp; on a single-shot sandbox that is a
   trap, and the host drops the instance #}
{% block bld_libs %}
{% if wasi %}
lib/shim/setjmp
{% endif %}
{% endblock %}

{# pwd.h and grp.h of a sandbox without users, written in the patch step,
   and pthread_cancel, which the single-threaded libc defines but does not
   declare #}
{% block cpp_includes %}
{% if wasi %}
${PWD}/ixshim
{% endif %}
{% endblock %}

{% block cpp_missing %}
{% if wasi %}
pthread_sync.h
${PWD}/ixshim/pthread_cancel.h
{% endif %}
{% endblock %}

{% block bld_tool %}
bin/gzip
{% endblock %}

{% block cxx_flags %}
{{super()}}
-Wno-register
{% if wasi %}
-fno-exceptions
{% endif %}
{% endblock %}

{# the single-threaded libc tells configure it has no pthread.h; GThreads.h
   reads HAVE_PTHREAD, and the shim answers pthread_create #}
{% block cpp_defines %}
{% if wasi %}
DJVU_NO_EXCEPTIONS
HAVE_PTHREAD=1
{% endif %}
{% endblock %}

{% block configure_flags %}
{% if wasi %}
--disable-xmltools
--disable-desktopfiles
{% endif %}
{% endblock %}

{# the tools are programs, the sandbox wants the library #}
{% block make_flags %}
{% if wasi %}
-C libdjvu
{% endif %}
{% endblock %}

{% block patch %}
{% if wasi %}
# G_TRY, G_CATCH, G_THROW without exceptions: a throw traps, a catch block
# is never entered but still compiles against its exception's name, by
# C++17's if with an initializer
cat << 'EOF' > libdjvu/GExceptionTrap.h
static inline const GException &g_exception_never(void) {
  static const GException never("never");
  return never;
}

// the cause of the trap, for the host to read back from the dead instance
inline char g_exception_cause[256];

[[noreturn]] static inline void g_exception_trap(const char *cause) {
  size_t n = 0;
  while (cause && cause[n] && n < sizeof(g_exception_cause) - 1) {
    g_exception_cause[n] = cause[n];
    n++;
  }
  g_exception_cause[n] = 0;
  __builtin_trap();
}

// G_RETHROW stands alone or takes an exception: an object traps as it is
// made, and takes the argument after
struct g_exception_rethrow {
  g_exception_rethrow(void) { g_exception_trap("rethrow"); }
  void operator()(const GException &) const {}
};

# define G_TRY         if (true)
# define G_CATCH(n)    else if (const GException &n = g_exception_never(); false) {
# define G_CATCH_ALL   else if (false) {
# define G_ENDCATCH    }
# define G_RETHROW     g_exception_rethrow()
# define G_THROW(msg)  g_exception_trap(msg)
EOF
sed -e 's|^#ifdef USE_EXCEPTION_EMULATION$|#if defined(DJVU_NO_EXCEPTIONS)\n# include "GExceptionTrap.h"\n#elif defined(USE_EXCEPTION_EMULATION)|' \
    -i libdjvu/GException.h
grep -q GExceptionTrap.h libdjvu/GException.h
# the one bare try/catch, around printing an s-expression
sed -e 's/^  try$/  if (true)/; s/^  catch(\.\.\.)$/  else/' -i libdjvu/miniexp.cpp
grep -q "if (true)" libdjvu/miniexp.cpp
# the password database of a sandbox without users: no entry, no user;
# the library looks there only to expand ~ in a path and to find a home
mkdir -p ixshim
cat << 'EOF' > ixshim/pwd.h
#pragma once
struct passwd {
  char *pw_name;
  char *pw_passwd;
  unsigned pw_uid;
  unsigned pw_gid;
  char *pw_gecos;
  char *pw_dir;
  char *pw_shell;
};
static inline struct passwd *getpwnam(const char *name) { (void)name; return 0; }
static inline struct passwd *getpwuid(unsigned uid) { (void)uid; return 0; }
static inline unsigned getuid(void) { return 0; }
EOF
cat << 'EOF' > ixshim/grp.h
#pragma once
struct group {
  char *gr_name;
  char *gr_passwd;
  unsigned gr_gid;
  char **gr_mem;
};
static inline struct group *getgrgid(unsigned gid) { (void)gid; return 0; }
EOF
cat << 'EOF' > ixshim/pthread_cancel.h
#pragma once
#include <pthread.h>
#ifdef __cplusplus
extern "C"
#endif
int pthread_cancel(pthread_t thread);
EOF
{% endif %}
{% endblock %}

{# the sandbox's module drives the library through its C++ API: the
   headers go out with it, and the config.h they were built with #}
{% block install %}
{{super()}}
{% if wasi %}
cp config.h libdjvu/*.h ${out}/include/libdjvu/
{% endif %}
{% endblock %}
