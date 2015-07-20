#!/bin/bash
# This script will create the User Environment to run ANSYS CFX under Slurm 
# Created by Jordi Blasco <jordi.blasco@hpcnow.com>, Bart Verleye
export CFX5RSH=ssh
export MPI_REMSH=ssh
export MPI_IC_ORDER="udapl:ibv:tcp"
#export MPI_CPU_AFFINITY=SLURM

CFX_HOSTLIST_TMP=`srun hostname -s | sort `
CFX_HOSTLIST_TMP=`echo $CFX_HOSTLIST_TMP | sed -e 's/ /,/g'`
export CFX_HOSTLIST=$CFX_HOSTLIST_TMP
