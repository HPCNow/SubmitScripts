#!/bin/bash
#SBATCH -J ITAC
#SBATCH -A hpcnow
#SBATCH --time=6:00:00
#SBATCH --mem-per-cpu=6144
#SBATCH --ntasks=48
#SBATCH --nodes=2
ml intel/2015a 
ml VTune/2015_update2
ml itac/9.0.3.051
source itacvars.sh impi5
######################################################################################
unset I_MPI_PMI_LIBRARY
mpiexec.hydra -trace /path/to/instrumented/code [my apps options]
