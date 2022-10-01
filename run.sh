#!/bin/bash

# Cleaning case
foamCleanCase

# Meshing
blockMesh

# Domain decomposition for parallel execution
decomposePar

# Parallel execution with mpi
mpirun -np 12 icoFoamFHD -parallel

# Reconstruct decomposed solution
reconstructPar

# Post Processing 
postProcess -func "vorticity"
postProcess -func "streamFunction"
