{# the library on the sandbox: single-threaded, the decoder's thread on
   the caller's through lib/shim/pthread, and without C++ exceptions,
   G_TRY/G_THROW becoming a trap of the instance, which the host drops;
   the library throws only on broken data, a sound file in memory never
   does #}

{% extends '//lib/djvulibre/common/ix.sh' %}

{# whoever links the library links the shim #}
{% block lib_deps %}
{{super()}}
lib/shim/pthread
{% endblock %}

{# libjpeg's error exit is a longjmp; on a single-shot sandbox that is a
   trap, and the host drops the instance #}
{% block bld_libs %}
lib/shim/setjmp
{% endblock %}

{# pwd.h and grp.h of a sandbox without users, written in the patch step,
   and pthread_cancel, which the single-threaded libc defines but does not
   declare #}
{% block cpp_includes %}
${PWD}/ixshim
{% endblock %}

{% block cpp_missing %}
pthread_sync.h
${PWD}/ixshim/pthread_cancel.h
{% endblock %}

{% block cxx_flags %}
{{super()}}
-fno-exceptions
{% endblock %}

{# the single-threaded libc tells configure it has no pthread.h; GThreads.h
   reads HAVE_PTHREAD, and the shim answers pthread_create #}
{% block cpp_defines %}
DJVU_NO_EXCEPTIONS
HAVE_PTHREAD=1
{% endblock %}

{% block patch %}
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
{% endblock %}
