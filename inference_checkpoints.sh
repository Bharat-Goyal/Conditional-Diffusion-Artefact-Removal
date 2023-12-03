#!/bin/bash
#SBATCH -J RecentInference                    # Job name
#SBATCH -n 1                                    # Number of cores required
#SBATCH --gres=gpu:4
#SBATCH -c 16
#SBATCH -t 4:00:00                              
#SBATCH -o RecentInference-%j.out                         # Combined output and error messages file
#SBATCH --mail-type=BEGIN,END,FAIL              # Mail preferences
#SBATCH --mail-user=bgoyal7@gatech.edu        # E-mail address for notifications
cd $SLURM_SUBMIT_DIR                            # Change to working directory

source ~/.bashrc
# module load anaconda3/2022.05.0.1                   # Load module dependencies
conda activate cdiff
# python scripts/parse_arca.py --start=0 --end=11572
#11573
cur=2
# nxt=$((cur+1))
cd /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaLarge${cur}
most_recent_checkpoint=$(ls -t | head -n 1)
#next line add ${cur}
checkpoint_path="/home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaLarge${cur}/$most_recent_checkpoint"
cd /home/hice1/bgoyal7/scratch/MLLimitedSupervision/Conditional-Diffusion-Artefact-Removal
# afterany:245268
srun ./inference.sh 2 arcaLargeFinal MostRecent ${checkpoint_path}
# srun ./inference.sh 2 arcaLargeFinal 80 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaLarge3/weights-7425.pt
# srun ./inference.sh 2 arcaLargeFinal 120 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaLarge4/weights-11475.pt
# srun ./inference.sh 2 arcaLargeFinal 160 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaLarge5/weights-16200.pt
# srun ./inference.sh 2 arcaLargeFinal 200 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaLarge6/weights-20925.pt
# srun ./inference.sh 2 arcaLargeFinal 241 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaLarge7/weights-24300.pt

 