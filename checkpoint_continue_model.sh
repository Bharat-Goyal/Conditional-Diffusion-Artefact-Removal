#!/bin/bash
#SBATCH -J ContinueFromCheckpoint                    # Job name
#SBATCH -n 1                                    # Number of cores required
#SBATCH --gres=gpu:4
#SBATCH -c 16
#SBATCH -t 4:00:00                              
#SBATCH -o ContinueFromCheckpoint-%j.out                         # Combined output and error messages file
#SBATCH --mail-type=BEGIN,END,FAIL              # Mail preferences
#SBATCH --mail-user=bgoyal7@gatech.edu        # E-mail address for notifications
source ~/.bashrc
conda activate cdiff

cur=6
nxt=$((cur+1))
cd /home/hice1/ksinha45/scratch/cs7647/cs7647/Conditional-Diffusion-Artefact-Removal/out/arcaLarge${cur}
most_recent_checkpoint=$(ls -t | head -n 1)
#next line add ${cur}
checkpoint_path="/home/hice1/ksinha45/scratch/cs7647/cs7647/Conditional-Diffusion-Artefact-Removal/out/arcaLarge${cur}/$most_recent_checkpoint"

cd $SLURM_SUBMIT_DIR
srun ./train.sh 2 arcaLarge${nxt} ${checkpoint_path}