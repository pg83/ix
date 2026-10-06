{# pthread_create for single-threaded sandboxes (wasm32-none): the
   thread's function runs on the calling thread, to completion. For a
   library that decodes on a thread of its own and waits for it, with the
   whole file already in memory, the decode is simply done when create
   returns. The consumer -includes pthread_sync.h (cpp_missing) ahead of
   its sources, which renames its calls to the shim's function: the
   target's libc defines a pthread_create of its own that cannot start a
   thread, and that one is left to nobody. The rest of the API stays the
   libc's single-threaded stubs. #}

{% extends '//die/inline/library.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block sources %}
pthread.c
pthread_sync.h
{% endblock %}
