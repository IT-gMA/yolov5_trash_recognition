#!/bin/bash  --login

#SBATCH --partition=gpuq
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBTACH --account=interns2021026
#SBATCH --export=NONE

module load singularity

time srun singularity remote login --tokenfile sylabs-token
time srun singularity build -r yolov5_run_container.sif build-container-on-pawsey.def