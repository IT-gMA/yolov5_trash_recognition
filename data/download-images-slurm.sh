#!/bin/bash  --login

#SBATCH --partition=gpuq
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBTACH --account=interns2021026
#SBATCH --export=NONE

echo "downloading"
curl -L "https://app.roboflow.com/ds/XDiW5Pncwf?key=4e2DXCWh2J" > roboflow.zip; unzip roboflow.zip; rm roboflow.zip
mv train/ test/ valid/ images/