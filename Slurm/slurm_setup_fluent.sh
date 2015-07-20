#!/usr/bin/env bash
export MPI_IC_ORDER="udapl:ibv:tcp"
HOSTSFILE=.hostlist-job$SLURM_JOB_ID
if [ "$SLURM_PROCID" == "0" ]; then
   srun hostname -f > $HOSTSFILE
fi
