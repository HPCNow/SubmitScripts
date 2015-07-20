# This script will create the User Environment to run Abaqus under Slurm 
# Created by Jordi Blasco <jordi.blasco@hpcnow.com>
# The previous releases of Abaqus was using HPMPI but the current one 6.13 uses Platform/IBM MPI which is not fully integrated with srun
# According to the slurm website, it seems that HP-MPI only needs -srun flag, and we can avoid to use the following lines of code.
# http://slurm.schedmd.com/mpi_guide.html#hp_mpi
envFile=abaqus_v6.env
if [[ -f $envFile ]]; then
    rm $envFile
fi
echo "import os">>$envFile
srun hostname -s | sort > slurm.hosts
mp_host_list="["
for i in $(cat slurm.hosts) ; do
    mp_host_list="${mp_host_list}['$i', 1],"
done
#mp_host_list=`echo ${mp_host_list} | sed -e "s/,$//" | sed -e "s/\-p/\-ib/g"`
mp_host_list=`echo ${mp_host_list}`
mp_host_list="${mp_host_list}]"
export mp_host_list
#echo "mp_host_list=${mp_host_list}" >>$envFile
echo "mp_host_list=${mp_host_list}" >>$envFile
echo "max_history_requests=0" >> $envFile
echo "mp_rsh_command = 'ssh -x -n -l %U %H %C'" >> $envFile
alias mpirun='mpirun -srun'
#echo "mp_mpirun_path = {HP:'/sNow/apps/Abaqus/6.13/installation/6.13-2/code/bin/SMAExternal/pmpi-8.3/bin/mpirun -srun'}" >> $envFile
#echo "mp_rsh_command = 'ssh -x -n -l %U %H %C'" >> $envFile
