#!/bin/bash
#
# SLURM Script for basic cluster testing
#
# This script requests minimal resources and executes simple commands 
# to verify Slurm job submission and execution on a test cluster.
#
#SBATCH --job-name=cluster-test
#SBATCH --nodes=4          # Requesting 4 nodes
#SBATCH --ntasks-per-node=1 # Requesting 1 task per node
#SBATCH --time=00:10:00    # Time limit of 10 minutes
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err
#SBATCH --partition=debug # Specify a relevant partition name

# --- Start of Script Execution ---

echo "--- Slurm Cluster Test Script Started ---"
echo "Job ID: $SLURM_JOB_ID"
echo "Attempting to run on node: $(hostname)"
echo "Start Time: $(date)"

# Simple workload to test cluster connectivity and resource allocation
echo "Running system uptime and hostname..."
hostname >> slurm-%j.out
uptime >> slurm-%j.out

echo "--- Slurm Cluster Test Script Finished ---"
exit 0
