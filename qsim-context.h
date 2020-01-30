#ifndef QSIM_CONTEXT_H
#define QSIM_CONTEXT_H

#include <ucontext.h>
typedef ucontext_t qsim_ucontext_t;

void qsim_swap_ctx(void);
void qsim_swap(void *opaque);

#endif
