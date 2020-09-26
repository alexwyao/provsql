#ifndef PROVSQL_SHMEM_H
#define PROVSQL_SHMEM_H

#include "postgres.h"
#include "storage/ipc.h"
#include "storage/lwlock.h"

#include "provsql_utils.h"

extern shmem_startup_hook_type prev_shmem_startup;
extern int provsql_init_nb_gates;
extern int provsql_max_nb_gates;
extern int provsql_avg_nb_wires;

void provsql_shmem_startup(void);
Size provsql_memsize(void);

typedef struct provsqlSharedState
{
  LWLock *lock; // protect access to the shared data
  constants_t constants;
  unsigned nb_wires;
  pg_uuid_t wires[FLEXIBLE_ARRAY_MEMBER];
} provsqlSharedState;
extern provsqlSharedState *provsql_shared_state;

#endif /* ifndef PROVSQL_SHMEM_H */
