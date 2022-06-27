#!/bin/bash
#SBATCH -J VTuneMPI
#SBATCH -A hpcnow
#SBATCH --time=6:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH -C ib
#SBATCH --ntasks=48
#SBATCH --nodes=2
ml 2021
ml intel/2021a
ml VTune/2021.6.0
ml itac/2021.5.0

# The following line uses GTOOL option to instruct Intel MPI to collect the hotspots metrics using VTune only on task #11.
export export I_MPI_GTOOL="vtune -collect hotspots -r result:10"
srun my_app [my_app_options]

#mpiexec.hydra my_app [my_app_options] : -n 1 vtune -c hotspots -r results_dir -- my_app [my_app_options]
