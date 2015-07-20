#!/bin/bash
#SBATCH -J VTuneMPI
#SBATCH -A hpcnow
#SBATCH --time=6:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH -C ib
#SBATCH --ntasks=48
#SBATCH --nodes=2
ml VTune/2015_update2
ml intel/2015a

srun amplxe-cl -result-dir my_result -collect hotspots -- my_app [my_app_ options]
