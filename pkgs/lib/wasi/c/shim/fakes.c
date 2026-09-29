void abort();

void __cxa_allocate_exception() {
    abort();
}

void __cxa_throw() {
    abort();
}

int __cxa_atexit(void (*)(void*), void*, void*);

// single-threaded wasm: thread_local destructors run at exit
int __cxa_thread_atexit(void (*dtor)(void*), void* obj, void* dso) {
    return __cxa_atexit(dtor, obj, dso);
}
