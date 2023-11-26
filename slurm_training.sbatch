#!/bin/bash
#SBATCH -J CheckpointArca                    # Job name
#SBATCH -n 1                                    # Number of cores required
#SBATCH --gres=gpu:4
#SBATCH -c 16
#SBATCH --mem=64G                        # Memory per core
#SBATCH -t 4:00:00                              
#SBATCH -o ContinueFromCheckpoint-%j.out                         # Combined output and error messages file
#SBATCH --mail-type=BEGIN,END,FAIL              # Mail preferences
#SBATCH --mail-user=bgoyal7@gatech.edu        # E-mail address for notifications
source ~/.bashrc
conda activate cdiff

cur=8
nxt=$((cur+1))
cd /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented${cur}
most_recent_checkpoint=$(ls -t | head -n 1)
checkpoint_path="/home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented${cur}/$most_recent_checkpoint"
##INSERT GIT BRANCH TO BE USED 
cd $SLURM_SUBMIT_DIR
# python scripts/parse_arca.py --start=0 --end=11572
#11573
srun ./inference.sh 2 arcaAugmented${nxt} 35100 ${checkpoint_path}                             # Example Process

#/home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented8/weights-35100.pt
