#!/bin/bash
# This script will create the User Environment to run ANSYS CFX under Slurm 
# Created by Jordi Blasco <jordi.blasco@hpcnow.com>, Bart Verleye
export CFX5RSH=ssh
export MPI_REMSH=ssh
export MPI_IC_ORDER="udapl:ibv:tcp"
#export MPI_CPU_AFFINITY=SLURM

envFile=ansys.env
rm $envFile
srun hostname -s | sort > slurm.hosts
for i in $(cat slurm.hosts) ; do
    mp_host_list="${mp_host_list}$i,"
done
mp_host_list=`echo ${mp_host_list} | sed -e "s/,$//"`
export mp_host_list
echo "${mp_host_list}" >>$envFile
unset mp_host_list
