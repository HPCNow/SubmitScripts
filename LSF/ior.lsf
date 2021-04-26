#!/bin/bash
#BSUB -J IOR
#BSUB -W 2:00
#BSUB -n 8
#BSUB -e %J.err
#BSUB -o %J.out
#BSUB -m "hostA hostD hostB"
module load openmpi/4.0.2

# Options
NUM_PROCS=8
#BLOCK_SIZE=$((3*${RAM_SIZE_PER_STORAGE_SERVER}*${NUM_STORAGE_SERVERS})/${NUM_PROCS}))
BLOCK_SIZE=4000
WORKDIR=$HOME/workdir/ior
mkdir -p $WORKDIR
cd $WORKDIR

#Multi-stream Throughput Benchmark
mpirun --map-by node -np ${NUM_PROCS} ~/IOR/IOR -wr -i5 -t2m -b ${BLOCK_SIZE} -g -F -e
-o $WORKDIR/ior_multi_stream_throughput.txt

#Shared File Throughput Benchmark
mpirun --map-by node -np ${NUM_PROCS} ~/IOR/IOR -wr -i5 -t1200k -b ${BLOCK_SIZE} -g -e
-o $WORKDIR/ior_share_file_throughput.txt

# IOPS Benchmark
mpirun --map-by node -np ${NUM_PROCS} ~/IOR/IOR -w -i5 -t4k -b ${BLOCK_SIZE} -F -z -g
-o $WORKDIR/ior_iops.txt
