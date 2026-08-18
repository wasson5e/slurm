#!/bin/bash
#SBATCH -n 8                       # Request 8 cores
#SBATCH -t 0-01:30                 # Runtime in D-HH:MM format
#SBATCH -p pi-cluster                     # Partition to run in
#SBATCH --mem=20G                  # Memory total in MB (for all cores)
#SBATCH -o %j.out                  # File to which STDOUT will be written, including job ID
#SBATCH -e %j.err                  # File to which STDERR will be written, including job ID
set -xv
echo Running on host $(hostname)
echo "Job id: ${SLURM_JOB_ID}" 
echo Time is $(date)
echo Directory is $(pwd)
echo "This job has allocated $SLURM_NPROCS processors in $SLURM_JOB_PARTITION partition "
cwd=$(pwd)
# create a randomly named scratch directory and copy your files there
export SCRATCH=$(mktemp -d /scratch/${USER}.XXXXXX)
echo "Using SCRATCH: ${SCRATCH}"
export GAUSS_SRCDIR=${SCRATCH}
# copy job files to $SCRATCH
cp -a * ${SCRATCH}
cd ${SCRATCH}

module load gaussian/16.B01-sse4

# start you g16 job (change the input/output file names for your job)
g16 < input.in >& output.out

# copy the results back to $HOME & cleanup
cp -a * ${cwd}
rm -rf ${SCRATCH}