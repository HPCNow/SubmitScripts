#!/bin/bash
# NCBI-BLAST+ SubmitScript
#################################################################
#SBATCH -J BLAST_4_THREADS
#SBATCH -A root         # Project Account
#SBATCH --time=08:00:00     # Walltime
#SBATCH --mem-per-cpu=4G  # memory/cpu
#SBATCH --ntasks=4
#SBATCH -o testBLAST_%J.out                        # File with the output
#SBATCH -e testBLAST_%J.err                        # File with the error - will contain the time in seconds it takes to run the benchmark
#################################################################
###  Load the Environment
ml BLAST+/2.11.0-gompi-2021a
ml CMake/3.20.1-GCCcore-10.3.0
#################################################################
#################################################################
### Benchmarking using this: https://fiehnlab.ucdavis.edu/staff/kind/collector/benchmark/blast-benchmark
# wget https://fiehnlab.ucdavis.edu/staff/kind/collector/benchmark/blast-benchmark
# The compressed benchmark is 1.8G, the uncompressed benchmark folder is 3.5G
# After uncompressing, the paths in the Makefile have to be updated to point to the correct folders

#################################################################
###  Run the Parallel Program
cd /home/easybuild/test/BLAST/benchmark/
time -p make -j 4 >> bresult.txt
########################################################
### The output from the benchmark (time in seconds) is:
#real 469.76
#user 1611.04
#sys 14.74
