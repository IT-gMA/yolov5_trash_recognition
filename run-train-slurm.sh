#!/bin/bash  --login

#SBATCH --partition=gpuq
#SBATCH --nodes=1
#SBATCH --gres=gpu:2
#SBATCH --time=24:00:00
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBTACH --account=interns2021026
#SBATCH --export=NONE
#SBATCH --output=train_run.out

module load cuda
module load singularity

export SINGULARITYENV_PYTHONUSERBASE="/group/interns2021026/mdoan/user_python"
export SINGULARITYENV_MPLCONFIGDIR="/group/interns2021026/mdoan/user_python/matplotlib"
export SINGULARITYENV_TORCH_HOME="/group/interns2021026/mdoan/torch_home"

SINGULARITYENV_CUDA=$CUDA_HOME
time srun singularity exec --nv $MYGROUP/yolov5_trash_recognition/yolov5_run_container.sif python $MYGROUP/yolov5_trash_recognition/train.py --weights yolov5l.pt --imgsz 720 --data data/data-info.yaml --epochs 1000 --save-period 4
