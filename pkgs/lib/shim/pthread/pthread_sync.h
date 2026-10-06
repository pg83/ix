/*
 * To be -included ahead of every source of a library that starts threads
 * on a single-threaded sandbox: its pthread_create calls go to the shim,
 * which runs the thread's function on the calling thread.
 */
#pragma once

#include <pthread.h>

#ifdef __cplusplus
extern "C"
#endif
int ix_pthread_create(pthread_t *thread, const pthread_attr_t *attr, void *(*start)(void *), void *arg);

#define pthread_create ix_pthread_create
