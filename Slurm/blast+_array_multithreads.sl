#!/bin/bash
# NCBI-BLAST+ SubmitScript
# Optimized for run 1000 array jobs using 4 Threads each.
#################################################################
#SBATCH -J BLAST_SHM_THREADS
#SBATCH -A hpcnow         # Project Account
#SBATCH --time=08:00:00     # Walltime
#SBATCH --mem-per-cpu=4G  # memory/cpu 
#SBATCH --cpus-per-task=4   # 4 OpenMP Threads
#SBATCH --array=1-1000      # Array definition 
#################################################################
###  Load the Environment
module load BLAST/2.2.29-intel-2015a
#################################################################
###  The files will be allocated in the /dev/shm FS 
echo $SHM_DIR
mkdir $SHM_DIR/{queries,results}
QUERY=frag_$(printf "%03d\n" $SLURM_ARRAY_TASK_ID)
cp -r /sNow/test/blast/queries/$QUERY $SHM_DIR/queries/
cd $SHM_DIR
#################################################################
###  Run the Parallel Program
echo $SLURM_ARRAY_TASK_ID
srun blastn -query queries/$QUERY                             \
            -db nt -task blastn -num_alignments 5             \
            -num_threads 3 -num_descriptions 5 -evalue 0.0001 \
            -out results/$QUERY.out
#################################################################
###  Transferring the results to the project directory
mkdir -p $HOME/OUT/BLAST
cp -pr results/$QUERY.out $HOME/OUT/BLAST/
