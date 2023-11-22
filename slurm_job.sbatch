#!/bin/bash
#SBATCH -J TrainFromScratch                    # Job name
#SBATCH -n 1                                    # Number of cores required
#SBATCH --gres=gpu:4
#SBATCH -c 16
#SBATCH -t 4:00:00                              
#SBATCH -o TrainFromScratch-%j.out                         # Combined output and error messages file
#SBATCH --mail-type=BEGIN,END,FAIL              # Mail preferences
#SBATCH --mail-user=bgoyal7@gatech.edu        # E-mail address for notifications
cd $SLURM_SUBMIT_DIR                            # Change to working directory

source ~/.bashrc
# module load anaconda3/2022.05.0.1                   # Load module dependencies
conda activate cdiff
# python scripts/parse_arca.py --start=0 --end=11572
#11573
srun ./train.sh 2 conditionOnXT                             # Example Process
