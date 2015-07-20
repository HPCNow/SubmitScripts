library(Rmpi)

id <- mpi.comm.rank(comm = 0)
np <- mpi.comm.size(comm = 0)
hostname <- mpi.get.processor.name()

msg <- sprintf("Hello world from process %03d of %03d, on host %s\n",
	id, np, hostname)
cat(msg)

mpi.barrier(comm = 0)
mpi.finalize()
