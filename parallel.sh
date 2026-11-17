#!/bin/bash
#SBATCH --job-name=multi_node_test
#SBATCH --partition=pi-cluster
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=00:05:00
#SBATCH --output=multi_node_test_%j.out

srun bash -c 'echo "Running on node: $(hostname)"; echo "scale=2; 1000 / 3" | bc'
