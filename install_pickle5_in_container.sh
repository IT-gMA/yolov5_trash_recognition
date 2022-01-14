#!/bin/bash  --login

#SBATCH --partition=gpuq
#SBATCH --nodes=1
#SBATCH --time=00:20:00
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBTACH --account=interns2021026
#SBATCH --output=log-install-opencv.out
#SBATCH --export=NONE

module load singularity

export SINGULARITYENV_PYTHONUSERBASE="/group/interns2021026/mdoan/user_python"
export SINGULARITYENV_MPLCONFIGDIR="/group/interns2021026/mdoan/user_python/matplotlib"
export SINGULARITYENV_TORCH_HOME="/group/interns2021026/mdoan/torch_home"

time srun singularity exec --nv $MYGROUP/yolov5_trash_recognition/yolov5_run_container.sif apt install -y libgl1-mesa-glx
