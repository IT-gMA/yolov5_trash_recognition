#!/bin/bash --login

#SBATCH --partition=gpuq
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --time=00:10:00
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBTACH --account=interns2021026
#SBATCH --output=train_run.out
#SBATCH --export=NONE

module load cuda
module load singularity

export SINGULARITYENV_PYTHONUSERBASE="/group/interns2021026/mdoan/user_python"
export SINGULARITYENV_MPLCONFIGDIR="/group/interns2021026/mdoan/user_python/matplotlib"
export SINGULARITYENV_TORCH_HOME="/group/interns2021026/mdoan/torch_home"
export SINGULARITYENV_RUNS="/group/interns2021026/mdoan/yolov5_trash_recognition/runs"
#export SINGULARITYENV_WANDB="/group/interns2021026/mdoan/user_python/wandb"
export SINGULARITYENV_YOLOV5="/group/interns2021026/mdoan/yolov5_trash_recognition"

SINGULARITYENV_CUDA=$CUDA_HOME
singularity exec --nv $MYGROUP/yolov5_trash_recognition/yolov5_run_container.sif wandb offline
time srun singularity exec --writable-tmpfs $MYGROUP/yolov5_trash_recognition/yolov5_run_container.sif python $MYGROUP/yolov5_trash_recognition/train.py --weights yolov5x.pt --imgsz 900 --cfg yolov5x.yaml --data data/data-info.yaml --epochs 200 --save-period 5 --batch-size 10 --cache
