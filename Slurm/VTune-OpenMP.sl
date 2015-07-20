#!/bin/bash
#SBATCH -J VTuneOpenMP
#SBATCH -A hpcnow
#SBATCH --time=1:00:00
#SBATCH --mem-per-cpu=4G
#SBATCH -C ib
#SBATCH --cpus-per-task=24
ml VTune/2015_update2
ml intel/2015a

srun amplxe-cl -result-dir my_profile_dir -collect hotspots ./my_binary
